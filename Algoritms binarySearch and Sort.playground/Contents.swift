import UIKit
// 1. Бинарный поиск - ищем индекс загадонного элемента через бинарный поиск в списке при сложности алгоритма O(logn) - логарифмическое время;
// через простой поиск было бы О(n) - простой поиск
// O(n * logn) = эффективный алгоритмы сортировки
// O(n^2)  - медленный алгоритмы сортировки
// O(n!) - очень медленные алгоритмы - задача о коммивояжере ( с 5 городов)


// Пример 1 бинарный поиск ( исключается половина чисел)  O(logn)


func binarySearch (array: [Int] , item: Int) -> Int? {
    var low = 0 // переменная low - левая граница
    var mid: Int // середина
    var guess: Int // угаданное число
    var high = array.count - 1 // правая граница
    while low <= high { // пока левая граница меньше или равна будет выполняться следующая функция, те пока эта часть не сократится до одного элемента
        mid = (low + high)/2
        guess = array[mid]
        if guess == item { // значение найдено
            return mid
            
        } else if guess > item { // угаданное значение больше заданного
            high = mid - 1
        } else {                 // угаданное значение меньше заданного
            low = mid + 1
        }
    }
    return nil
}

binarySearch(array: [1,2,3,4], item: 1)
binarySearch(array: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21], item: 11)

// Пример 2 - поиск наименьшего элемента массива
func findSmallest ( arr: [Int]) -> Int? {
    
    var smallest = arr[0]
    var smallestIndex = 0
    for i in Range(uncheckedBounds: (1, arr.count)) {
        if arr[i] <= smallest {
            smallest = arr[i]
            smallestIndex = i
            return smallestIndex
        }
    }
    return nil
}
findSmallest(arr: [2,3,5,6,7,8,9,11,12,14,15,17])

func countDown(i:Int) {
    
    print(i)
    if i > 0 {
         return
  }
}
print(countDown(i: 1))

// быстрая сортировка
func quickSort<T:Comparable>(_ list: [T]) -> [T] {
    // если в нашем массиве больше, чем один элемент, то имеет смысл его сортировать
    if list.count > 1 {
        
        //определяем опорный элемент - середина массива
        let pivot = list[0+(list.count - 0)/2]
        
        //создаём массив элементов меньших, чем опорный
        var less:[T] = []
        //создаём массив элементов эквивалентных опорному
        var equal:[T] = []
        //создаём массив элементов больших, чем опроный
        var greater:[T] = []
        
        //проходим по массиву и сортируем элементы по группам
        for element in list {
            if element < pivot {
                less.append(element)
            } else if element == pivot {
                equal.append(element)
            } else if element > pivot {
                greater.append(element)
            }
        }
        return quickSort(less) + equal + quickSort(greater)
    } else {
        return list
    }
}
quickSort([11,2])
quickSort([11,12,9,8,7,6,3,2,1])
// сортировка выбором
func selectionSort<T:Comparable>(_ list: [T]) -> [T] {
    var sortList = list
    
    //ищем минимальный элемент в массиве
    for i in sortList.indices {
        var min = i
        for j in i..<sortList.count {
            if sortList[j] < sortList[min] {
                min = j
            }
        }
        //меняем местами элементы пока весь массив не будет отсортирован
        if min != i {
            sortList.swapAt(min, i)
        }
    }
    return sortList
}
selectionSort([11,12,9,8,7,6,3,2,1])
// пузырьковая сортировка
func bubleSort<T:Comparable>(_ list: [T]) -> [T] {
    var sortList = list

    //алгоритм повторяется n-1 раз, где n - количество элементов в массиве
    for i in 0..<(sortList.count-1) {
        for j in 0..<(sortList.count-1-i) {
            //элемент массива сравнивается с последующим
            if sortList[j] > sortList[j+1] {
                //элементы меняются местами, таким образом:
                //"легкие" элементы перемещаются к началу списка
                //"тяжёлые" элементы - к концу списка
                sortList.swapAt(j, j+1)
            }
        }
    }
    return sortList
}
bubleSort([11,12,9,8,7,6,3,2,1])
[11,12,9,8,7,6,3,2,1]

var arr: [Int] = [11,12,9,8,7,6,3,2,1]
arr.sort()

// Сортировка Шелла
func shellSort<T:Comparable>(_ list: [T]) -> [T] {
    var sortList = list
    
    //сравнивать будем элементы, находящиеся друг от друга на некотором расстоянии
    var step = sortList.count/2
    
    // пока шаг не будет равен 1
    while step > 0 {
        //разбиваем исходный массив на группы из элементов отстоящих друг от друга на шаг
        for i in step..<sortList.count {
            //значение первого элемента из пары для сравнения
            let value = sortList[i]
            var j = i
            
            while j >= step && sortList[j-step] > value {
                sortList[j] = sortList[j-step]
                j -= step
            }
            //после сравнения меняем местами элементы
            sortList[j] = value
        }
        //сокращаем шаг, тем самым уменьшая количество групп
        step /= 2
    }
    return sortList
}

shellSort([1,23,4,5,6,77])
