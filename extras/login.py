# class login  user1 
import json
import os
class Login:
    
# constructor user_id and password   
    def __init__(self ,user_id , password ):
        self.user_id = user_id
        self.password = password 
        

    def read_file(self , file_name) -> dict:
        """ This method reads the json file accepts a parameter file_name as string """
        with open( file_name, 'r') as f:
            content = json.load(f) # json => dict 
            f.close()
        return content

    content = read_file(file_name)
# method to check the user_id is present : user_id is present : boolen => yes 
    def check_user_id(self )-> bool:
        
        content = self.read_file(file_name)
        if self.user_id in content.key():
            if self.password == content.get(self.user_id):
                print("login sucessfully !!")
            else :
                print("Please check the credentials ..")
        else:
            pass # call the method insert_new_user 

            

# wirte the cred to json file  => 
    def insert_new_user(self  , cred:dict) :
        """ This method accepts the dict content to write in a file  """ 
        new_dict = {"age" : 20 }
        with open(self.file_name ,'w') as f:
            json.dump(cred , f )


