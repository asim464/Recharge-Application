import json
import sys,random,string
from math import floor
from array import array

import binascii
import requests
from flask_cors import CORS
from flask import Flask, Response, request, Blueprint, jsonify

from rfid.base import CommandRunner, ReaderCommand, ReaderResponseFrame, ReaderInfoFrame, ReaderType
from rfid.command import CF_GET_READER_INFO, G2_TAG_INVENTORY
from rfid.response import G2_TAG_INVENTORY_STATUS_MORE_FRAMES
from rfid.command import G2_WRITE_EPC
from rfid.transport import TcpTransport
from rfid.transport_serial import SerialTransport
from rfid.uhfreader18 import G2InventoryResponseFrame as G2InventoryResponseFrame18
from rfid.uhfreader288m import G2InventoryCommand, G2InventoryResponseFrame as G2InventoryResponseFrame288

TCP_PORT = 6000

tag_blueprint = Blueprint('tag', __name__, template_folder='rfid')

from app import config

def write_epc(runner, value):
    if len(value) % 2 > 0:
        raise ValueError('Value must be a whole number of words, i.e. multiple of two bytes')
    password = [0, 0, 0, 0]
    write_data = [floor(len(value) / 2)] + password + value
    # print(write_data)
    write_cmd = ReaderCommand(G2_WRITE_EPC, data=write_data)
    write_resp = ReaderResponseFrame(runner.run(write_cmd))
    return write_resp.result_status


def write_tag_value(reader_addr, tag_value):

    
    if reader_addr.startswith('/') or reader_addr.startswith('COM'):
        transport = SerialTransport(device=reader_addr)
    else:
        transport = TcpTransport(reader_addr, reader_port=TCP_PORT)

    runner = CommandRunner(transport)
    try:
        # print(tag_value)
        write_tag_status = write_epc(runner, tag_value)
        if write_tag_status == 0:
            print('Tag written successfully')
            transport.close()
            return 0
        elif write_tag_status == 0xFA:
            print('Error: Poor communication, try repositioning the tag')
            transport.close()
            return 2
        elif write_tag_status == 0xFB:
            print('Error: No tags found, is a tag in place?')
            transport.close()
            return 3
    except ValueError as e:
        print('Could not write value: {}'.format(e))
        sys.exit(1)

    transport.close()

def get_reader_type(runner):
    get_reader_info = ReaderCommand(CF_GET_READER_INFO)
    reader_info = ReaderInfoFrame(runner.run(get_reader_info))
    return reader_info.type


def read_tag_rfid(reader_addr):

    
    if reader_addr.startswith('/') or reader_addr.startswith('COM'):
        transport = SerialTransport(device=reader_addr)
    else:
        transport = TcpTransport(reader_addr, reader_port=TCP_PORT)
    runner = CommandRunner(transport)
    try:
        get_inventory_cmd = ReaderCommand(G2_TAG_INVENTORY)
        frame_type = G2InventoryResponseFrame18
        transport.write(get_inventory_cmd.serialize())
        inventory_status = None
        while inventory_status is None or inventory_status == G2_TAG_INVENTORY_STATUS_MORE_FRAMES:
            # g2_response = G2InventoryResponseFrame288(transport.read_frame())
            g2_response = G2InventoryResponseFrame18(transport.read_frame())
            inventory_status = g2_response.result_status
            for tag in g2_response.get_tag():
                print('Antenna %d: EPC %s, RSSI %s' % (tag.antenna_num, tag.epc.hex(), tag.rssi))
        transport.close()
        return tag.epc.hex()
    except ValueError as e:
        print('Unknown reader type: {}'.format(e))

        #sys.exit(1)
    transport.close()    


@tag_blueprint.route("/write", methods=['POST'])
def write_tag():
    

    try:
        lst = [random.choice(string.hexdigits  + string.digits) for n in range(24)]
        data = "".join(lst)
        

        if data is not None:
            a_string = str(data)
            n = 2
            split_strings = [a_string[index : index + n] for index in range(0, len(a_string), n)]
            newlist=[]
            for index in split_strings:
                newlist.append(int(index,16))
            resp = write_tag_value(config.rfid, newlist)
            if resp != 0:
                return jsonify({"message": "failure"}), 205
            return jsonify({"TAG_VALUE": a_string}), 201
            
        else:
            return jsonify({"message": "failure"}), 205
    except Exception as e:
        
        return jsonify({"message": "failure"}), 205



@tag_blueprint.route("/read", methods=['GET'])
def read_tag():

    try:
        
        resp = read_tag_rfid(config.rfid)
        if resp != 0:
            return jsonify({
                "TAG_VALUE": resp
            }),201
        return jsonify({"message": "failure"}), 205
    except Exception as e:
        
        return jsonify({"message": "failure"}), 201



