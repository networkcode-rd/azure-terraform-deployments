list_a = [1,2,3,4]
list_b = [5,6,7,8]

# list_c = list_a + list_b
list_c = [*list_a, *list_b]
print(list_c)