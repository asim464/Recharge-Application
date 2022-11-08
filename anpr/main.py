import base64
import json
import threading
import time
import cv2
import imutils
from imutils.video import VideoStream
import PIL.Image as Image
from flask import Response
from flask import Flask
from flask import render_template
from base64 import b64encode
import zlib
from anpr.video import Video
import time
import logging
import json
from flask import jsonify

from NetSDK.NetSDK import NetClient
from NetSDK.SDK_Struct import *
from NetSDK.SDK_Enum import EM_LOGIN_SPAC_CAP_TYPE, EM_EVENT_IVS_TYPE
from NetSDK.SDK_Callback import fDisConnect, fHaveReConnect, CB_FUNCTYPE

from flask_cors import CORS, cross_origin
from setuptools.glob import glob

from configparser import ConfigParser
from flask import Flask, Response, request, Blueprint

from anpr.TrafficDemo import TrafficCallBackAlarmInfo
from anpr.TrafficDemo import TrafficWnd
from datetime import datetime

from NetSDK.NetSDK import NetClient
from NetSDK.SDK_Enum import EM_LOGIN_SPAC_CAP_TYPE
from NetSDK.SDK_Struct import *
from NetSDK.SDK_Callback import fDisConnect, fHaveReConnect, CB_FUNCTYPE

main_blueprint = Blueprint('main', __name__, template_folder='anpr')


config = ConfigParser()
config.read("config.ini")

current_card = None

tag_process = False
trafficObj = TrafficWnd
traffic = TrafficCallBackAlarmInfo

carImage = None
b64_string = None
b64_stringP = None
timestamp = None
callback_num = 0
plateNum = None


@main_blueprint.route("/video")
def video():
    try:
        return Response(Video.get_instance().generate(), mimetype="multipart/x-mixed-replace; boundary=frame")
    except Exception as e:
        print(e)
        return json.dump({"response": "failed!", "message": e}), 205


@main_blueprint.route("/listen_anpr", methods=["GET"])
@cross_origin()
def listen_anpr():
    try:
        
        if plateNum is not None:
           
            return jsonify({"data": plateNum}), 200
        else:
            return Response(status=204)
    except Exception as e:
        print(" EXCEPTION OCCURRED !")
        print(e)

class Base64Encoder(json.JSONEncoder):
    
    def default(self, o):
        if isinstance(o, bytes):
            return b64encode(o).decode()
        return json.JSONEncoder.default(self, o)


@main_blueprint.route("/get_images", methods=["GET"])
@cross_origin()
def get_images():
    try:
        if b64_string is not None and b64_stringP is not None:
            
            m = {'key': b64_string.decode(), 'plate': b64_stringP.decode()}
            return jsonify(m), 200
        else:
            return Response(status=204)
    except Exception as e:
        print(" EXCEPTION OCCURRED !")
        print(e)

#FOR RTSP STREAM


def disconnect_callback(self, lLoginID, pchDVRIP, nDVRPort, dwUser):
    print('Disconnect')


def reconnect_callback(self, lLoginID, pchDVRIP, nDVRPort, dwUser):
    print('Reconnect')


@CB_FUNCTYPE(None, C_LLONG, C_DWORD, c_void_p, POINTER(c_ubyte), C_DWORD, C_LDWORD, c_int, c_void_p)
def AnalyzerDataCallBack(lAnalyzerHandle, dwAlarmType, pAlarmInfo, pBuffer, dwBufSize, dwUser, nSequence, reserved):
    global callback_num
    global plateNum
    global timestamp
    global carImage
    global b64_string
    global b64_stringP
    
    if (lAnalyzerHandle == trafficObj.attachID) and (dwAlarmType == EM_EVENT_IVS_TYPE.TRAFFICJUNCTION):
        local_path = os.path.abspath('.')
        is_global = False
        is_small = False
        show_info = TrafficCallBackAlarmInfo()
        callback_num += 1
        alarm_info = cast(pAlarmInfo, POINTER(DEV_EVENT_TRAFFICJUNCTION_INFO)).contents
        show_info.get_alarm_info(alarm_info)
        if alarm_info.stuObject.bPicEnble:
            now = datetime.now()
            timestamp = datetime.timestamp(now)
            
            is_global = True
            GlobalScene_buf = cast(pBuffer, POINTER(c_ubyte * alarm_info.stuObject.stPicInfo.dwOffSet)).contents
            
            if not os.path.isdir(os.path.join(local_path, 'Global')):
                os.mkdir(os.path.join(local_path, 'Global'))
            with open('./Global/Global_Img' + str(int(timestamp)) + '.jpg', 'wb+') as global_pic:
                
                global_pic.write(bytes(GlobalScene_buf))
            with open('./Global/Global_Img' + str(int(timestamp)) + '.jpg', "rb") as img_file:
                b64_string = base64.b64encode(img_file.read())
                
            if (alarm_info.stuObject.stPicInfo.dwFileLenth > 0):
                is_small = True
                small_buf = pBuffer[alarm_info.stuObject.stPicInfo.dwOffSet:alarm_info.stuObject.stPicInfo.dwOffSet +
                                                                            alarm_info.stuObject.stPicInfo.dwFileLenth]
                if not os.path.isdir(os.path.join(local_path, 'Small')):
                    os.mkdir(os.path.join(local_path, 'Small'))
                with open('./Small/Small_Img' + str(int(timestamp)) + '.jpg', 'wb+') as small_pic:
                    
                    small_pic.write(bytes(small_buf))
                with open('./Small/Small_Img' + str(int(timestamp)) + '.jpg', "rb") as img_file_plate:
                    b64_stringP = base64.b64encode(img_file_plate.read())
                    
        elif (dwBufSize > 0):
            is_global = True
            GlobalScene_buf = cast(pBuffer, POINTER(c_ubyte * dwBufSize)).contents
            if not os.path.isdir(os.path.join(local_path, 'Global')):
                os.mkdir(os.path.join(local_path, 'Global'))
       
        trafficObj.plateNumber = show_info.plate_number_str
        
        plateNum = trafficObj.plateNumber
        print(plateNum)
        return



def traffic_events():
    print("HOLD UP !")

    global plateNum

    ip = '192.168.172.123'
    port = int('37777')
    username = 'admin'
    password = '1234$abcd'

    sdk = NetClient()
    sdk.InitEx()

    stuInParam = NET_IN_LOGIN_WITH_HIGHLEVEL_SECURITY()
    stuInParam.dwSize = sizeof(NET_IN_LOGIN_WITH_HIGHLEVEL_SECURITY)
    stuInParam.szIP = ip.encode()
    stuInParam.nPort = port
    stuInParam.szUserName = username.encode()
    stuInParam.szPassword = password.encode()
    stuInParam.emSpecCap = EM_LOGIN_SPAC_CAP_TYPE.TCP
    stuInParam.pCapParam = None

    stuOutParam = NET_OUT_LOGIN_WITH_HIGHLEVEL_SECURITY()
    stuOutParam.dwSize = sizeof(NET_OUT_LOGIN_WITH_HIGHLEVEL_SECURITY)

    vehNuber = C_LLONG()
    loginID = C_LLONG()
    playID = C_LLONG()
    attachID = C_LLONG()
    m_DisConnectCallBack = fDisConnect(trafficObj.DisConnectCallBack)
    m_ReConnectCallBack = fHaveReConnect(trafficObj.ReConnectCallBack)

    loginID, device_info, error_msg = sdk.LoginWithHighLevelSecurity(stuInParam, stuOutParam)
    
    print(loginID, device_info, error_msg)

    sdk.SetAutoReconnect(m_ReConnectCallBack)

    channel = 0
    bNeedPicFile = 1
    dwUser = 0
    trafficObj.attachID = NetClient.RealLoadPictureEx(loginID, channel, EM_EVENT_IVS_TYPE.TRAFFICJUNCTION, bNeedPicFile,
                                                      AnalyzerDataCallBack, dwUser, None)
    

    if not trafficObj.attachID:
        print("提示(prompt) error:" + str(sdk.GetLastError()))
    else:
        print("提示(prompt)订阅成功(Subscribe success)")

@CB_FUNCTYPE(None, C_LLONG, POINTER(c_ubyte), c_uint, c_uint, C_DWORD, C_LDWORD)
def callback_snap(lLoginID,pBuf,RevLen,EncodeType,CmdSerial,dwUser):
    pic_buf = cast(pBuf, POINTER(c_ubyte * RevLen)).contents
    with open('./capture.jpg', 'wb+') as f:
        f.write(pic_buf)
        f.close()

def capture_events():
    print("HOLD UP !")
    ip = '192.168.171.128'
    port = int('37777')
    username = 'admin'
    password = '1234$abcd'

    sdk = NetClient()
    sdk.InitEx()

    stuInParam = NET_IN_LOGIN_WITH_HIGHLEVEL_SECURITY()
    stuInParam.dwSize = sizeof(NET_IN_LOGIN_WITH_HIGHLEVEL_SECURITY)
    stuInParam.szIP = ip.encode()
    stuInParam.nPort = port
    stuInParam.szUserName = username.encode()
    stuInParam.szPassword = password.encode()
    stuInParam.emSpecCap = EM_LOGIN_SPAC_CAP_TYPE.TCP
    stuInParam.pCapParam = None

    stuOutParam = NET_OUT_LOGIN_WITH_HIGHLEVEL_SECURITY()
    stuOutParam.dwSize = sizeof(NET_OUT_LOGIN_WITH_HIGHLEVEL_SECURITY)

    
    loginID = C_LLONG()
    
    m_DisConnectCallBack = fDisConnect(trafficObj.DisConnectCallBack)
    m_ReConnectCallBack = fHaveReConnect(trafficObj.ReConnectCallBack)

    loginID, device_info, error_msg = sdk.LoginWithHighLevelSecurity(stuInParam, stuOutParam)
    print(loginID, device_info, error_msg)

    dwUser = 0
    
    sdk.SetSnapRevCallBack(OnSnapRevMessage=callback_snap,dwUser=dwUser)
    channel = 1
    snap = SNAP_PARAMS()
    snap.Channel = channel
    snap.Quality = 1
    snap.mode = 0
    sdk.SnapPictureEx(loginID,snap)

traffic_events()

