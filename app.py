from enum import Flag
from msilib.schema import Patch
from colorama import Cursor
from flask import Flask, redirect, session, url_for, request, json, jsonify, flash, Blueprint, send_file,Response
from flask.wrappers import Request
from connection import cnxn, cursor
from datetime import date, datetime ,timedelta
import calendar
from werkzeug.wrappers import response
from uuid import uuid4
from flask_cors import CORS
import pyodbc as odbc
from configparser import ConfigParser
from modules.admin import admin_blueprint
from anpr.main import main_blueprint
from rfid.tag import tag_blueprint
from flask_cors import CORS
from config import Config
from configparser import ConfigParser
from database import Database
from config import Config
config = ConfigParser()
config.read("config.ini")
config = Config(config)
db = Database(config)

from flask_jwt_extended import (
    JWTManager, jwt_required, create_access_token,
    get_jwt_identity
)

app = Flask(__name__)
app.config['JWT_SECRET_KEY'] = "\xfd{H\xeddwwt5<\4495\qwer9\xe3\x321qwer5\xd1\x234234O<!\asdf\xa2\xa0\x9fR"

jwt = JWTManager(app)
cors = CORS(app, resources={r"/*": {"origins": "*"}})

app.register_blueprint(admin_blueprint)
app.register_blueprint(main_blueprint)
app.register_blueprint(tag_blueprint)

@app.route('/login', methods=['GET','POST'])
def login():
    try:
        if request.method == 'POST':
            data= request.get_json()
            username = data[0]['username']
            password = data[0]['password']
            query_fetch_user = ("SELECT * from tbl_admin_user WHERE username = ?")
            
            user = db.selectQuery(querry=query_fetch_user,values=(username,))

            if not user:
                print("user doesn't exist")
                return jsonify({"message": "failure"}), 205
            else:
                if user[0]['username'] == username and user[0]['password'] == password:
                    access_token = create_access_token(identity={"user_id": user[0]['user_id'], "email": user[0]['email'], "username": user[0]['email'], "role_id": user[0]['role_id']})
                    return jsonify({"user_data":user[0],"token":access_token}), 201
                else:
                    return jsonify({"message": "failure"}), 205
    except Exception as e:
        return json.dump({"response": "failed!", "message": e}), 205

@app.route('/user', methods=['GET', 'POST', 'PUT', 'PATCH'])
def user():

    if request.method == 'POST':
        try:
            req_data = request.get_json()
            print(req_data)

            name = req_data[0]['username']
            Pass = 123456
            email = req_data[0]['email']
            mobilenumber = req_data[0]['mobile_number']
            roleid = req_data[0]['role_id']
            company_id = req_data[0]['company_id']
            reg_center_id = req_data[0]['reg_center_id']
            status = req_data[0]['status']
            createby = req_data[0]['created_by']

            querry1 = f'''select * from [recharge_db].[dbo].[tbl_admin_user]
                          WHERE username=?'''
            
            data = db.selectQuery(querry=querry1, values=(name,))

            if len(data)>0:
                return json.dumps({"response": "Fail!", "message": "User Already Exist with this UserName"}), 205

            querry = f'''INSERT INTO [recharge_db].[dbo].[tbl_admin_user] (username, password, email, role_id, company_id, reg_center_id, mobile_number, status, created_by, is_deleted)
                    VALUES(?,?,?,?,?,?,?,?,?,?) '''
            
            val = (name, Pass, email, roleid, company_id, reg_center_id, mobilenumber, status, createby, 0)
            db.updateQuery(querry=querry,values=val)
            return json.dumps({"response": "Success!", "message": "User Created"}), 201
        except Exception as e:
            return json.dumps({"response": "failed!", "message": e}), 205

    if request.method == 'PUT':
        try:
            req_data = request.get_json()
            user_id = req_data[0]['user_id']
            Pass = 123456
            email = req_data[0]['email']
            mobilenumber = req_data[0]['mobile_number']
            roleid = req_data[0]['role_id']
            company_id = req_data[0]['company_id']
            reg_center_id = req_data[0]['reg_center_id']
            status = req_data[0]['status']
            updateby = req_data[0]['updated_by']

            querry = f'''UPDATE [recharge_db].[dbo].[tbl_admin_user]
                        SET  password = ?,email=?,role_id =?,mobile_number=?, company_id=?, reg_center_id=?, status=?, updated_by=? WHERE user_id=?'''
            
            val = (Pass, email, roleid,mobilenumber, company_id, reg_center_id, status, updateby, user_id)
            db.updateQuery(querry=querry, values=val)
            return json.dumps({"response": "Success!", "message": "User Updated"}), 201

        except Exception as e:
            return json.dumps({"response": "failed!", "message": e}), 205

    if request.method == 'PATCH':
        try:
            req_data = request.get_json()
            print("data", req_data)
            user_id = req_data[0]['user_id']
            querry = f'''UPDATE [recharge_db].[dbo].[tbl_admin_user]
                                            SET is_deleted =? WHERE user_id=?'''
           
            val = (1, user_id)
            db.updateQuery(querry=querry, values=val)

            return json.dumps({"response": "Success!", "message": "User Deleted"}), 201
        except Exception as e:
            return json.dumps({"response": "failed!", "message": e}), 205

    try:
        querry1 = f'''select * from tbl_admin_user as a
        left join tbl_lkpt_roles as b on a.role_id=b.role_id
         where a.is_deleted=0'''
        
        usersdata = db.selectQuery(querry=querry1,)

        if len(usersdata)==0:
            return json.dumps({"response": "failed!", "message": "No user found"}), 205
        else:
            return json.dumps({"response": "Success!", "userdata": usersdata}), 201
    except Exception as e:
        return json.dumps({"response": "failed!", "message": e}), 205


@app.route('/user_roles', methods=['GET', 'POST', 'PUT', 'PATCH'])
def user_roles():

    if request.method == 'POST':
        try:
            req_data = request.get_json()
            role_name = req_data[0]['role_name']
            role_type = req_data[0]['role_type']
            status = 0

            querry1 = f'''select * from tbl_lkpt_roles
                          WHERE role_name=?'''
            
            data = db.selectQuery(querry=querry1,values=(role_name,))
            if len(data)>0:
                return json.dumps({"response": "Fail!", "message": "Role Already Exist with this Role Name"}), 205

            querry = f'''INSERT INTO tbl_lkpt_roles (role_name, role_type, status)
                    VALUES(?,?,?) '''
            
           
            val = (role_name, role_type, status)
            db.updateQuery(querry=querry, values=val)
            return json.dumps({"response": "Success!", "message": "Role Created"}), 201
        except Exception as e:
            return json.dumps({"response": "failed!", "message": e}), 205

    if request.method == 'PUT':
        try:
            req_data = request.get_json()
            role_id = req_data[0]['role_id']
            role_name = req_data[0]['role_name']
            role_type = req_data[0]['role_type']
            status =req_data[0]['status']

            querry = f'''UPDATE tbl_lkpt_roles
                        SET  role_name = ?,role_type=?,status =? WHERE role_id=?'''
            
            val = (role_name, role_type, status, role_id)
            db.updateQuery(querry=querry, values=val)

            return json.dumps({"response": "Success!", "message": "Role Updated"}), 201

        except Exception as e:
            return json.dumps({"response": "failed!", "message": e}), 205

    if request.method == 'PATCH':
        try:
            req_data = request.get_json()
            role_id = req_data[0]['role_id']
            status = 2
            querry = f'''UPDATE tbl_lkpt_roles
                        SET status =? WHERE role_id=?'''
            
            val = (1, role_id)
            db.updateQuery(querry=querry, values=val)
            return json.dumps({"response": "Success!", "message": "Role Deleted"}), 201
        except Exception as e:
            return json.dumps({"response": "failed!", "message": e}), 205

    try:
        querry1 = f'''select * from tbl_lkpt_roles where status=0'''
        
        roledata = db.selectQuery(querry=querry1)

        if len(roledata)==0:
            return json.dumps({"response": "failed!", "message": "No user found"}), 205
        else:
            return json.dumps({"response": "Success!", "roledata": roledata}), 201
    except Exception as e:
        return json.dumps({"response": "failed!", "message": e}), 205


@app.route('/assgn_menu_to_roles', methods=['POST', 'GET'])
def assgn_menu_to_roles():
    try:
        if request.method ==  'POST':
            req_data = request.get_json()
            process_id = req_data[0]['process_id']
            if process_id == 1:
                query = ("TRUNCATE TABLE  tbl_admin_menu_rel")
                cursor.execute(query)
                cnxn.commit()

                req_data = req_data[0]['rid_mid']        
                for x in range(len(req_data)):
                    array = req_data[x].split(":")
                    role_id = array[1]
                    menu_id = array[0]
                    print(role_id, menu_id)
                    query = ("INSERT INTO tbl_admin_menu_rel (menu_id, role_id, rel_string) VALUES (?, ?, ?)")
                    
                    val = (menu_id, role_id, req_data[x])
                    db.updateQuery(querry=query, values=val)

                return json.dumps({"response": "Success!"}), 201
            if process_id == 2:
                role_id = req_data[0]['role_id']                
                query = ("SELECT * FROM tbl_admin_menu_rel WHERE role_id=?")
                rm_data= db.selectQuery(querry=query,values=(role_id,))
                

                return json.dumps({"rm_data": rm_data}), 201

        else:
            rm_array = []
            query = ("SELECT rel_string FROM tbl_admin_menu_rel")
            rm_data = db.selectQuery(querry=query)
            

            for rm in rm_data:
                rm_array.append(rm['rel_string'])
                
            return json.dumps({"rm_data": rm_array}), 201

    except Exception as e:
       return json.dumps({"response": "failed!", "message": e}), 205 



@app.route('/menu', methods=['GET', 'POST', 'PUT', 'PATCH'])
def menu():
    
    if request.method == 'POST':
        req_data = request.get_json()
        menu_name = req_data[0]['menu_name']
        is_parent = req_data[0]['is_parent']
        menu_url = req_data[0]['menu_url']
        menu_icon = req_data[0]['menu_icon']
        parent_menu_id = req_data[0]['parent_menu_id']
        created_by = req_data[0]['created_by']
        created_at = datetime.today().strftime('%Y-%m-%d %H:%M:%S')

        query = ("""
            INSERT INTO 
            tbl_admin_menu 
            (menu_name, menu_icon, menu_url, is_parent, parent_menu_id, created_by, created_at)
            VALUES
            (?, ?, ?, ?, ?, ?, ?)
            """)
        
        val = (menu_name, menu_icon, menu_url, is_parent, parent_menu_id, created_by, created_at)
        db.updateQuery(querry=query, values=val)

        return json.dumps({"response": "Success!", "message": "Menu Added Successfully"}), 201


    if request.method == 'PUT':
        req_data = request.get_json()
        menu_id = req_data[0]['menu_id']
        menu_name = req_data[0]['menu_name']
        is_parent = req_data[0]['is_parent']
        menu_url = req_data[0]['menu_url']
        menu_icon = req_data[0]['menu_icon']
        parent_menu_id = req_data[0]['parent_menu_id']
        updated_by = req_data[0]['updated_by']
        updated_at = datetime.today().strftime('%Y-%m-%d %H:%M:%S')

        query = ("""
            UPDATE 
            tbl_admin_menu 
            SET                
            menu_name = ?, 
            menu_icon = ?, 
            menu_url = ?, 
            is_parent = ?, 
            parent_menu_id = ?, 
            created_by = ?, 
            created_at = ?
            WHERE
            menu_id =  ?              
            """)
        
        val = (menu_name, menu_icon, menu_url, is_parent, parent_menu_id, updated_by, updated_at, menu_id)
        db.updateQuery(querry=query, values=val)

        return json.dumps({"response": "Success!", "message": "Menu Updated Successfully"}), 201


    if request.method == 'PATCH':
        req_data = request.get_json()
        menu_id = req_data[0]['menu_id']

        query = ("DELETE FROM tbl_admin_menu WHERE menu_id=?")
        val = (menu_id)
        db.updateQuery(querry=query, values=val)

        return json.dumps({"response": "Success!", "message": "Menu Deleted Successfully"}), 201

    
    query = ("""
        SELECT menu_id, menu_name, menu_icon, menu_url, is_parent, parent_menu_id FROM tbl_admin_menu order by sequence_id asc
    """)
   
    menu_data = db.selectQuery(querry=query)      

    return json.dumps({"menu_data":menu_data}), 201
    
        
@app.route('/made_type_class', methods=['GET'])
def made_type_class():
    try:
        get_vehicle_made_query = ("""
            SELECT * FROM tbl_lkpt_vehicle_made
        """)
        
        vehicle_made=db.selectQuery(querry=get_vehicle_made_query)
        get_vehicle_type_query = ("""
            SELECT * FROM tbl_lkpt_vehicle_type
        """)
        
        vehicle_type=db.selectQuery(querry=get_vehicle_type_query)

        get_vehicle_class_query = ("""
            SELECT * FROM tbl_lkpt_vehicle_class
        """)
        
        vehicle_class=db.selectQuery(querry=get_vehicle_class_query)



        return jsonify({"vehicle_made":vehicle_made, "vehicle_type":vehicle_type, "vehicle_class":vehicle_class}), 201
    except Exception as e:
        return json.dump({"response": "failed!", "message": e}), 205


@app.route("/reg_centers", methods=['GET'])
def reg_centers():
    try:
        query  = ("""
            SELECT * FROM tbl_lkpt_reg_centers
        """)
        
        reg_centers=db.selectQuery(querry=query)
        return jsonify({"reg_centers":reg_centers}), 201
    except Exception as e:
        print(e)
        return json.dump({"response": "failed!", "message": e}), 205


if __name__ == '__main__':
    host= f"{config.host}"
    port = f"{config.port}"
    app.run(host=host, port=port, debug=True)
    #serve(app, host='10.0.1.6', port=5050, url_scheme='http')


