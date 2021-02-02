unsorted = [3, 1, 6, 11, 3, 2, 9, 7, 14, 10, 12]
print('Unsorted list:', unsorted)


# Bubble sort #############################################
def bubble_sort(lst: list) -> list:
    for border in range(len(lst) - 1, 0, -1):
        for i in range(border):
            if lst[i] > lst[i + 1]:
                lst[i], lst[i + 1] = lst[i + 1], lst[i]
    return lst


print('Bubble sorted list:', bubble_sort(unsorted))


# Merge sort ##############################################
def merge_sort(lst: list) -> list:
    if len(lst) < 2:
        return lst
    border = len(lst) // 2
    left_part = lst[:border]
    right_part = lst[border:]

    left_part = merge_sort(left_part)
    right_part = merge_sort(right_part)

    result = []
    while left_part and right_part:
        if left_part[0] < right_part[0]:
            result.append(left_part[0])
            left_part.remove(left_part[0])
        else:
            result.append(right_part[0])
            right_part.remove(right_part[0])
    if not left_part:
        result += right_part
    else:
        result += left_part
    return result


unsorted = [3, 1, 6, 11, 3, 2, 9, 7, 14, 10, 12]
print('Merge sorted list:', merge_sort(unsorted))


# Insertion sort ##########################################
def insertion_sort(lst: list) -> list:
    for i in range(1, len(lst)):
        position = i
        current_value = lst[position]

        while position > 0 and lst[position - 1] > current_value:
            lst[position] = lst[position - 1]
            position -= 1
        lst[position] = current_value

    return lst


print('Insertion sorted list:', insertion_sort(unsorted))


# Selection sort ##########################################
def selection_sort(lst: list) -> list:
    for i in range(len(lst)):
        i_min = i

        for j in range(i, len(lst)):
            if lst[i_min] > lst[j]:
                i_min = j

        lst[i], lst[i_min] = lst[i_min], lst[i]

    return lst


unsorted = [3, 1, 6, 11, 3, 2, 9, 7, 14, 10, 12]
print('Selection sorted list:', selection_sort(unsorted))
