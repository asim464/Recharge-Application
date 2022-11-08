from colorama import Cursor
import os
from pathlib import Path
import requests
import flask
from enum import Flag
from flask import Flask, render_template, redirect, session, url_for, request, json, jsonify, flash, Blueprint, send_file, Request
from flask.wrappers import Request
from datetime import date, datetime,timedelta
from werkzeug.wrappers import response
from werkzeug.utils import secure_filename


from uuid import uuid4
from connection import cnxn, cursor

admin_blueprint = Blueprint('admin', __name__, template_folder='modules')

@admin_blueprint.route('/companies', methods=['GET', 'POST', 'PUT', 'PATCH'])
def companies():
    if request.method == 'POST':        
        try:
            req_data = request.get_json()
            cname = req_data[0]['company_name']
            officialno = req_data[0]['official_number']
            registrant_officialno = req_data[0]['registrant_number']
            registrant_designation = req_data[0]['registrant_designation']
            registrant_mobile = req_data[0]['registrant_mobile']

            querry = f'''INSERT INTO [recharge_db].[dbo].[tbl_reg_companies] 
                (
                    company_name,
                    official_number,
                    registrant_number,
                    registrant_designation,
                    registrant_mobile,
                    status
                )
                VALUES(?,?,?,?,?,?) '''            
            cursor.execute(querry, (cname, officialno, registrant_officialno, registrant_designation,registrant_mobile, 0))
            cnxn.commit()
            return json.dumps({"response": "Success!", "message": "Company Created"}), 201
        except Exception as e:
            return json.dumps({"response": "failed!", "message": e}), 205


    if request.method == 'PUT':
        try:
            req_data = request.get_json()
            company_id = req_data[0]['company_id']
            cname = req_data[0]['company_name']
            officialno = req_data[0]['official_number']
            registrant_officialno = req_data[0]['registrant_number']
            registrant_designation = req_data[0]['registrant_designation']
            registrant_mobile = req_data[0]['registrant_mobile']
            status = req_data[0]['status']


            querry = f'''UPDATE [recharge_db].[dbo].[tbl_reg_companies] 
                SET
                company_name=?,
                official_number=?,
                registrant_number=?,
                registrant_designation=?,
                registrant_mobile=?,
                status=?
                WHERE
                company_id=?
                '''            
            cursor.execute(querry, (cname, officialno, registrant_officialno, registrant_designation,registrant_mobile, status, company_id))
            cnxn.commit()
            return json.dumps({"response": "Success!", "message": "Company Updated"}), 201
        except Exception as e:
            return json.dumps({"response": "failed!", "message": e}), 205

    if request.method == 'PATCH':
        try:
            req_data = request.get_json()
            company_id = req_data[0]['company_id']            
            status = 2


            querry = f'''UPDATE [recharge_db].[dbo].[tbl_reg_companies] 
                SET                
                status=?
                WHERE
                company_id=?
                '''            
            cursor.execute(querry, (status, company_id))
            cnxn.commit()
            return json.dumps({"response": "Success!", "message": "Company Deleted"}), 201
        except Exception as e:
            return json.dumps({"response": "failed!", "message": e}), 205

            
    try:
        querry1 = f'''select * from [recharge_db].[dbo].[tbl_reg_companies]
                        WHERE status!=?'''
        cursor.execute(querry1, (2))
        desc = cursor.description
        column_names = [col[0] for col in desc]
        companiesdata = [dict(zip(column_names, row))
                for row in cursor.fetchall()]

        if len(companiesdata)==0:
            return json.dumps({"response": "failed!", "message": "No companies found"}), 205
        else:            
            return json.dumps({"response": "Success!", "companiesdata": companiesdata}), 201
    except Exception as e:
        return json.dumps({"response": "failed!", "message": e}), 205


@admin_blueprint.route('/fleet_management/<id>', methods=['GET'])
def fleet_managementt(id):
    try:
        print(id)
        company_id = id
        querry1 = f'''select * from [recharge_db].[dbo].[tbl_reg_fleets]
                        WHERE is_deleted=? AND company_id=?'''
        cursor.execute(querry1, (0, company_id))
        desc = cursor.description
        column_names = [col[0] for col in desc]
        fleetdata = [dict(zip(column_names, row))
                for row in cursor.fetchall()]

        if len(fleetdata)==0:
            return json.dumps({"response": "failed!", "message": "No Fleets found"}), 205
        else:            
            return json.dumps({"response": "Success!", "fleetdata": fleetdata}), 201
    except Exception as e:
        return json.dumps({"response": "failed!", "message": e}), 205

@admin_blueprint.route('/fleet_management', methods=['GET', 'POST', 'PUT', 'PATCH'])
def fleet_management():
    if request.method == 'POST':
        try:
            req_data = request.get_json()
            fleet_name = req_data[0]['fleet_name']
            company_id = req_data[0]['company_id']
            number_of_vehicles = req_data[0]['number_of_vehicles']
            fleet_type = req_data[0]['fleet_type']
            status = req_data[0]['status']
            created_by = req_data[0]['created_by']       
            created_at = datetime.today().strftime('%Y-%m-%d %H:%M:%S')    
            

            querry = f'''INSERT INTO [recharge_db].[dbo].[tbl_reg_fleets] 
                (
                    fleet_name,
                    company_id,
                    number_of_vehicles,
                    fleet_type,
                    status,
                    created_by,
                    created_at,
                    is_deleted
                )
                OUTPUT inserted.fleet_id
                VALUES(?,?,?,?,?,?,?,?)'''            
            cursor.execute(querry, (fleet_name, company_id, number_of_vehicles, fleet_type, status, created_by, created_at, 0))
            fleet_id = cursor.fetchone()

            query = ("""
                INSERT INTO tbl_vehicle_account
                (
                open_balance,
                payment_type,
                payment_amount,
                vehicle_id,
                fleet_id,
                close_balance,
                created_at,
                created_by
                )
                VALUES (?,?,?,?,?,?,?,?)
            """)
            cursor.execute(query, (0, 'Account Created', 0, 0, fleet_id[0], 0, created_at, created_by))
            cnxn.commit()

            
            return json.dumps({"response": "Success!", "message": "Fleet Created"}), 201
        except Exception as e:
            return json.dumps({"response": "failed!", "message": e}), 205


    if request.method == 'PUT':
        try:
            req_data = request.get_json()
            fleet_id = req_data[0]['fleet_id']
            fleet_name = req_data[0]['fleet_name']
            number_of_vehicles = req_data[0]['number_of_vehicles']
            fleet_type = req_data[0]['fleet_type']
            status = req_data[0]['status']
            updated_by = 1       
            updated_at = datetime.today().strftime('%Y-%m-%d %H:%M:%S')  

            querry = f'''UPDATE [recharge_db].[dbo].[tbl_reg_fleets] 
                SET
                fleet_name=?,
                number_of_vehicles=?,
                fleet_type=?,
                status=?,
                updated_by=?,
                updated_at=?
                
                WHERE
                fleet_id=?
                '''            
            cursor.execute(querry, (fleet_name, number_of_vehicles, fleet_type, status, updated_by, updated_at, fleet_id))
            cnxn.commit()
            return json.dumps({"response": "Success!", "message": "Company Updated"}), 201
        except Exception as e:
            return json.dumps({"response": "failed!", "message": e}), 205

    if request.method == 'PATCH':
        try:
            fleet_id = request.json[0]['fleet_id']
            querry1 = f'''select * from [recharge_db].[dbo].[tbl_reg_fleets]
                          WHERE fleet_id=?'''
            data=cursor.execute(querry1, (fleet_id))
            data= cursor.fetchall()
            if len(data)==0:
                return json.dumps({"response": "failed!", "message": "Fleet Not Found Against This ID"}), 205
            else:
                print("runing")
                querry = f'''UPDATE [recharge_db].[dbo].[tbl_reg_fleets]
                                               SET is_deleted =? WHERE fleet_id=?'''
                cursor.execute(querry, (1, fleet_id))
                print(querry)
                # cursor.execute(querry)
                cnxn.commit()
                return json.dumps({"response": "Success!", "message": "Fleet Deleted"}), 201
        except Exception as e:
            return json.dumps({"response": "failed!", "message": e}), 205

            
    try:
        req_data = request.get_json()
        company_id = req_data['company_id']
        querry1 = f'''select * from [recharge_db].[dbo].[tbl_reg_fleets]
                        WHERE is_deleted=? AND company_id=?'''
        cursor.execute(querry1, (0, company_id))
        desc = cursor.description
        column_names = [col[0] for col in desc]
        fleetdata = [dict(zip(column_names, row))
                for row in cursor.fetchall()]

        if len(fleetdata)==0:
            return json.dumps({"response": "failed!", "message": "No Fleets found"}), 205
        else:            
            return json.dumps({"response": "Success!", "companiesdata": fleetdata}), 201
    except Exception as e:
        return json.dumps({"response": "failed!", "message": e}), 205

@admin_blueprint.route('/fleet_relation', methods=['GET', 'POST', 'PUT', 'PATCH', 'DELETE'])
def fleet_relation():
    try:
        if request.method == 'POST':
            req_data = request.get_json()
            vehicle_ids = req_data[0]['vehicle_id']
            fleet_id = req_data[0]['fleet_id']
            company_id = req_data[0]['company_id']
            created_by = req_data[0]['created_by']
            created_at = datetime.today().strftime('%Y-%m-%d %H:%M:%S')
            status = 0
            is_deleted = 0

            for vehicle in vehicle_ids:
                query = ("""
                    INSERT INTO tbl_rel_fleet
                    (
                        fleet_id,
                        vehicle_id,
                        created_by,
                        created_at,
                        status,
                        is_deleted
                    )
                    VALUES(?,?,?,?,?,?)
                """)
                cursor.execute(query, (fleet_id, vehicle, created_by, created_at, status, is_deleted))
                cnxn.commit()


            return json.dumps({"response": "Success!"}), 201
        
        if request.method == 'PUT':
            req_data = request.get_json()
            fleet_id = req_data[0]['fleet_id']
            querry1 = f'''
                SELECT * from tbl_rel_fleet as a
                LEFT JOIN tbl_reg_fleets as b ON a.fleet_id=b.fleet_id
                LEFT JOIN tbl_reg_vehicle as c ON c.vehicle_id=a.vehicle_id
                WHERE a.is_deleted=? AND b.fleet_id=?'''
            cursor.execute(querry1, (0, fleet_id))
            desc = cursor.description
            column_names = [col[0] for col in desc]
            fleetdata = [dict(zip(column_names, row))
                    for row in cursor.fetchall()]

            if len(fleetdata)==0:
                return json.dumps({"response": "failed!", "message": "No Fleets found"}), 205
            else:            
                return json.dumps({"response": "Success!", "fleetdata": fleetdata}), 201

        if request.method == 'DELETE':            
            fleet_rel_id = request.json['rel_id']
            query = ("DELETE FROM tbl_rel_fleet WHERE rel_id=?")
            cursor.execute(query, (fleet_rel_id))
            cnxn.commit()
            return json.dumps({"response": "Success!"}), 201
        
    except Exception as e:
        return json.dumps({"response": "failed!", "message": e}), 205


@admin_blueprint.route('/delete_relations', methods=['POST'])
def delete_relations():
    try:
        req_data = request.get_json()
        print(req_data)
        fleet_rel_id = req_data[0]['rel_id']
        query = ("DELETE FROM tbl_rel_fleet WHERE rel_id=?")
        cursor.execute(query, (fleet_rel_id))
        cnxn.commit()
        return json.dumps({"response": "Success!"}), 201

    except Exception as e:
        return json.dumps({"response": "failed!", "message": e}), 205




@admin_blueprint.route('/register_vehicle', methods=['GET', 'POST', 'PUT', 'PATCH'])
def register_vehicle():
    try:
        if request.method == 'POST':        
            
            req_data = request.get_json()
            print(req_data)
            vehicle_registration_no = req_data['vehicle_registration_no']
            vehicle_made_id = req_data['vehicle_made_id']
            vehicle_modal = req_data['vehicle_modal']
            vehicle_color = req_data['vehicle_color']
            vehicle_type_id = req_data['vehicle_type_id']
            owner_mobile_no = req_data['owner_mobile_no']
            vehicle_owner_name = req_data['vehicle_owner_name']
            vehicle_owner_cnic = req_data['vehicle_owner_cnic']
            reg_center_id = req_data['reg_center_id']
            is_company = req_data['is_company']
            if is_company == 1:
                company_id = req_data['company_id']
            else:
                company_id = 0
            owner_mobile_sec = 0
            vehicle_owner_address = req_data['vehicle_owner_address']
            remarks = req_data['remarks']
            vehicle_engine_no = req_data['vehicle_engine_no']
            province_id = req_data['province_id']
            city_id = req_data['city_id']
            drivers_license = req_data['drivers_license']
            m_tag_token = req_data['m_tag_token']
            vehicle_chasis_no = req_data['vehicle_chasis_no']
            vehicle_class_id = req_data['vehicle_class_id']
            issue_date = datetime.today().strftime('%Y-%m-%d')
            expiry_date = req_data['expiry_date']
            tag_type_id = 0
            drivers_license = req_data['drivers_license']
            created_by = req_data['created_by']
            created_at = datetime.today().strftime('%Y-%m-%d %H:%M:%S') 
            status = 0
            
            
            query_insert_vehicle = ("""
                INSERT INTO tbl_reg_vehicle
                (
                    vehicle_registration_no,
                    vehicle_made_id,
                    vehicle_modal,
                    vehicle_color,
                    vehicle_type_id,
                    owner_mobile_no,
                    vehicle_owner_name,
                    vehicle_owner_cnic,
                    reg_center_id,
                    is_company,
                    company_id,
                    owner_mobile_sec,
                    vehicle_owner_address,
                    remarks,
                    vehicle_engine_no,
                    province_id,
                    city_id,
                    drivers_license,
                    m_tag_token,
                    vehicle_chasis_no,
                    vehicle_class_id,
                    issue_date,
                    expiry_date,
                    tag_type_id,                    
                    created_by,
                    created_at,
                    status
                )
                OUTPUT inserted.vehicle_id
                VALUES
                (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
                """)
            cursor.execute(query_insert_vehicle, (
                vehicle_registration_no,
                vehicle_made_id,
                vehicle_modal,
                vehicle_color,
                vehicle_type_id,
                owner_mobile_no,
                vehicle_owner_name,
                vehicle_owner_cnic,
                reg_center_id,
                is_company,
                company_id,
                owner_mobile_sec,
                vehicle_owner_address,
                remarks,
                vehicle_engine_no,
                province_id,
                city_id,
                drivers_license,
                m_tag_token,
                vehicle_chasis_no,
                vehicle_class_id,
                issue_date,
                expiry_date,
                tag_type_id,
                created_by,
                created_at,
                status))            
            vehicle_id = cursor.fetchone()

            query = ("""
                INSERT INTO tbl_vehicle_account
                (
                open_balance,
                payment_type,
                payment_amount,
                vehicle_id,
                fleet_id,
                close_balance,
                created_at,
                created_by
                )
                values
                (?,?,?,?,?,?,?,?)
            """)
            cursor.execute(query, (0, 'Account Created', 0, vehicle_id[0], 0, 0, created_at, created_by))
            cnxn.commit()

            return json.dumps({"response": "success", "message": "Vehicle Inserted Successfully"}), 201  
            
           
    except Exception as e:
        return json.dumps({"response": "failed!", "message": e}), 205

@admin_blueprint.route('/registered_vehicles', methods=['POST'])
def registered_vehicles():
    try:
        req_data = request.get_json()
        company_id = req_data[0]['company_id']
        print(company_id)
        query = ("SELECT * FROM tbl_reg_vehicle WHERE vehicle_id NOT IN(SELECT vehicle_id FROM tbl_rel_fleet) and company_id=?")
        cursor.execute(query, (company_id))
        desc = cursor.description
        column_names = [col[0] for col in desc]
        vehicles = [dict(zip(column_names, row))
                for row in cursor.fetchall()]

        return json.dumps({"vehicles": vehicles}), 201
    except Exception as e:
        return json.dumps({"response": "failed!", "message": e}), 205

@admin_blueprint.route('/provinces', methods=['GET'])
def provinces():
    try:
        query = "SELECT * FROM tbl_lkpt_provinces"
        cursor.execute(query)
        desc = cursor.description
        column_names = [col[0] for col in desc]
        provinces = [dict(zip(column_names, row))
                for row in cursor.fetchall()]

        return json.dumps({"provinces": provinces}), 201            
    except Exception as e:
        return json.dumps({"response": "failed!", "message": e}), 205

@admin_blueprint.route('/cities', methods=['GET'])
def cities():
    try:
        query = "SELECT * FROM tbl_lkpt_cities"
        cursor.execute(query)
        desc = cursor.description
        column_names = [col[0] for col in desc]
        cities = [dict(zip(column_names, row))
                for row in cursor.fetchall()]

        return json.dumps({"cities": cities}), 201            
    except Exception as e:
        return json.dumps({"response": "failed!", "message": e}), 205


@admin_blueprint.route('/vehicle_search', methods=['POST'])
def vehicle_search():
    try:
        vehicle_id = request.json[0]['vehicle_id']
        query = ("SELECT top(1) * FROM tbl_reg_vehicle as v left outer join tbl_vehicle_account as c on v.vehicle_id=c.vehicle_id  WHERE v.vehicle_id=? order by  c.created_at desc")
        cursor.execute(query, (vehicle_id))
        desc = cursor.description
        column_names = [col[0] for col in desc]
        vehicle_data = [dict(zip(column_names, row))
                for row in cursor.fetchall()]
        
        if vehicle_data:
            return json.dumps({"vehicle_data": vehicle_data}), 201            
        else:
            return json.dumps({"message": "Vehicle not found"}), 205
    
    except Exception as e:
        return json.dumps({"response": "failed!", "message": e}), 208



@admin_blueprint.route('/recharge_balance', methods=['POST'])
def recharge_balance():
    try:
        data = request.get_json()
        print(data)
        # exit()
        recharge_type = request.json['recharge_type']        

        if recharge_type == 'vehicle':
            payment_type = 'recharge'
            vehicle_id = request.json['vehicle_id']
            payment_amount = request.json['payment_amount']
            payment_status = request.json['payment_status']
            payment_method = request.json['payment_method']
            fleet_id = 0
            created_by = request.json['created_by']
            created_at = datetime.today().strftime('%Y-%m-%d %H:%M:%S')
            print("vehicle_id", vehicle_id)
            query = ("""
                SELECT TOP 1 * FROM tbl_vehicle_account WHERE vehicle_id=? ORDER BY account_id DESC;
            """)
            cursor.execute(query, (vehicle_id))
            desc = cursor.description
            column_names = [col[0] for col in desc]
            vehicle_account = [dict(zip(column_names, row))
                    for row in cursor.fetchall()]

            print("something", vehicle_account)

            open_balance = vehicle_account[0]['close_balance']
            close_balance = open_balance + payment_amount


            query = ("""
                INSERT INTO tbl_vehicle_account
                (
                open_balance,
                payment_type,
                payment_amount,
                payment_status,
                payment_method,
                vehicle_id,
                fleet_id,
                close_balance,
                created_at,
                created_by
                )
                VALUES
                (?,?,?,?,?,?,?,?,?,?)
            """)
            cursor.execute(query, (open_balance, payment_type, payment_amount, payment_status, payment_method, vehicle_id, fleet_id, close_balance, created_at, created_by))
            cnxn.commit()

            print("runing")
        
            return json.dumps({"message": "success"}), 201
        elif recharge_type == 'fleet':
            payment_type = 'recharge'
            vehicle_id = 0
            payment_amount = request.json['payment_amount']
            payment_status = request.json['payment_status']
            payment_method = request.json['payment_method']
            fleet_id = request.json['fleet_id']
            created_by = request.json['created_by']
            created_at = datetime.today().strftime('%Y-%m-%d %H:%M:%S')

            query = ("""
                SELECT TOP 1 * FROM tbl_vehicle_account WHERE fleet_id=? ORDER BY account_id DESC
            """)
            cursor.execute(query, (fleet_id))
            desc = cursor.description
            column_names = [col[0] for col in desc]
            fleet_account = [dict(zip(column_names, row))
                    for row in cursor.fetchall()]

            open_balance = fleet_account[0]['close_balance']
            print(fleet_account)
            
            close_balance = open_balance + payment_amount


            query = ("""
                INSERT INTO tbl_vehicle_account
                (
                open_balance,
                payment_type,
                payment_amount,
                payment_status,
                payment_method,
                vehicle_id,
                fleet_id,
                close_balance,
                created_at,
                created_by
                )
                VALUES
                (?,?,?,?,?,?,?,?,?,?)
            """)
            cursor.execute(query, (open_balance, payment_type, payment_amount, payment_status, payment_method, vehicle_id, fleet_id, close_balance, created_at, created_by))
            cnxn.commit()
            print("Running")
            return json.dumps({"message": "Fleet Recharged Successfully"}), 201
    
    except Exception as e:
        return json.dumps({"response": "failed!", "message": e}), 208

@admin_blueprint.route('/mtag_vehicle_list', methods=['GET'])
def mtag_vehicle_list():
    try:        
        query = ("""
            SELECT * FROM tbl_reg_vehicle where vehicle_id not in (SELECT vehicle_id FROM tbl_vehicle_mtag_rel)            
        """)
        cursor.execute(query)
        desc = cursor.description
        column_names = [col[0] for col in desc]
        vehicles = [dict(zip(column_names, row))
                for row in cursor.fetchall()]

        return json.dumps({"vehicles": vehicles}), 201
    
    except Exception as e:
        return json.dumps({"response": "failed!", "message": e}), 208


@admin_blueprint.route('/mtag_binding', methods=['POST'])
def mtag_binding():
    try:        
        vehicle_id = request.json['vehicle_id']
        mtag_token = request.json['mtag_token']

        query = ("""
            INSERT INTO tbl_vehicle_mtag_rel
            (vehicle_id, mtag_token)
            VALUES
            (?, ?)
        """)
        cursor.execute(query, (vehicle_id, mtag_token))
        cnxn.commit()

        return json.dumps({"message": "Record Binded Successfully"}), 201
    
    except Exception as e:
        return json.dumps({"response": "failed!", "message": e}), 208




@admin_blueprint.route('/test_mtag', methods=['GET'])
def test_mtag():
    try:        
        resp = requests.get(f"http://10.0.107.223:5000/read")
        if resp.status_code==201:
            data = json.loads(resp.text)
            mtag_token=data['TAG_VALUE']

            # mtag_token = request.json['mtag_token']

            query = ("""
                SELECT * FROM tbl_reg_vehicle as a
                LEFT JOIN tbl_vehicle_mtag_rel as b on a.vehicle_id=b.vehicle_id
                WHERE b.mtag_token=?
            """)
            cursor.execute(query, (mtag_token))
            desc = cursor.description
            column_names = [col[0] for col in desc]
            vehicle_data = [dict(zip(column_names, row))
                    for row in cursor.fetchall()]
            
            if vehicle_data:
                return json.dumps({"vehicle_data": vehicle_data}), 201
            else:
                return json.dumps({"message": "No Record Found"}), 205
            
    
    except Exception as e:
        return json.dumps({"response": "failed!", "message": e}), 208
        


        