object = input("enter the object : ")
key = input("enter the key : ")

# to take only key value from the inputs

def find_alphabates(input):
    t = ""
    for i in input:
        if (i >= 'A' and i <= 'Z') or (i >= 'a' and i <= 'z'):
            t += i
    return t


final_object = find_alphabates(object)
final_key = find_alphabates(key)

# finding out the difference between object and key
value = list(set(final_object)-set(final_key))[0]
print(f"value = {value}")