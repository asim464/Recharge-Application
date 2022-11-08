import time
from imutils.video import VideoStream
from imutils import resize
import threading
import cv2
# from app.config import Config
# from app import logger


class Video:
    _instance = None
    _lock = threading.Lock()

    @staticmethod
    def get_instance(reset=False):
        if reset:
            with Video._lock:
                if Video._instance is not None:
                    Video._instance.end = True
                    if Video._instance.video_thread:
                        Video._instance.end = True
                        Video._instance.video_stream.stop()
                        if Video._instance.video_thread:
                            Video._instance.video_thread.join()
                    Video._instance = None
        if not Video._instance:
            with Video._lock:
                if not Video._instance:
                    Video._instance = Video()
        return Video._instance

    def __init__(self):
        self.video_stream = None

        self.connection_timeout_thread = threading.Thread(target=self.connection)
        self.connection_timeout_thread.daemon = True
        self.connection_timeout_thread.start()

        self.connect_thread = None
        self.video_thread = None

        self.output_frame = None
        self.end = False
        self.lock = threading.Lock()

    def connection(self):
        self.connect_thread = threading.Thread(target=self.connect)
        self.connect_thread.daemon = True
        self.connect_thread.start()

        time.sleep(10)

        if self.video_stream:
            self.video_thread = threading.Thread(target=self.read_frames)
            self.video_thread.daemon = True
            self.video_thread.start()

    def connect(self):
        try:
            url = f"rtsp://admin:1234$abcd@192.168.172.123:554"
            # url = f"rtsp://{Config.CAMERA_USER}:{Config.CAMERA_PASSWORD}@{Config.CAMERA_IP}:{Config.CAMERA_PORT}"
            self.video_stream = VideoStream(url).start()
            # logger.info(f'Video Connected: ')
        except Exception as e:
            print(e)
            # logger.error(f'Video Exception: {e}')

    def read_frames(self):
        while True:
            time.sleep(0.1)
            try:
                if self.end:
                    break

                frame = self.video_stream.read()
                if frame is not None:
                    frame = resize(frame, width=630)
                    with self.lock:
                        self.output_frame = frame.copy()
            except Exception as e:
                self.connect()
                print(e)
                # logger.error(f'Video Exception: {e}')

    def generate(self):
        while True:
            try:
                time.sleep(0.05)
                if self.end:
                    break

                with self.lock:
                    if self.output_frame is None:
                        continue
                    (flag, encodedImage) = cv2.imencode(".jpg", self.output_frame)
                    if not flag:
                        continue
                yield (b'--frame\r\n' b'Content-Type: image/jpeg\r\n\r\n' +
                       bytearray(encodedImage) + b'\r\n')
            except Exception as e:
                print(e)
                # logger.error(f'Video Exception: {e}')