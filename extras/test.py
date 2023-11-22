import Login

user1 =  Login("Amit" ,"Amit@1234")
content = user1.read_file('cred.json')
print(content)