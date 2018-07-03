//: Playground - noun: a place where people can play

import UIKit

class Node{
    var value: Int
    var nextNode: Node! = nil
    
    init(value: Int, nextNode: Node) {
        self.value = value
        self.nextNode = nextNode
    }
    
    init(value: Int) {
        self.value = value
    }
}

class LinkedList{
    var headNode: Node! = nil
    var isEmpty: Bool{
        return headNode == nil ? true:false
    }
    
    func count() -> Int{
        if isEmpty{
          return 0
        }else{
            var node = headNode
            var count = 0
            while node != nil{
              count += 1
              node = node?.nextNode
            }
            return count
        }
    }
    
    func insert(_ value: Int, at position: Int) -> Bool{
        if position == 0 {
            let newNode = Node(value: value)
            headNode = newNode
            return true
        }else if count() >= position{
            let newNode = Node(value: value)
            var tempNode:Node! = nil
            for _ in 0...(position-1){
                if tempNode == nil{
                    tempNode = headNode
                }else{
                    tempNode = tempNode?.nextNode
                }
            }
            
            if count() > position{
                newNode.nextNode = tempNode?.nextNode
            }
            
            tempNode?.nextNode = newNode
            return true
        }else{
            print("Error: Couldn't item insert at given position.")
            return false
        }
    }
    
    func deleteNode(at position: Int) -> Bool{
        if position == 0 {
            headNode = headNode.nextNode
            return true
        }else if count() > position{
            var tempNode:Node! = nil
            for _ in 0...(position-1){
                if tempNode == nil{
                    tempNode = headNode
                }else{
                    tempNode = tempNode?.nextNode
                }
            }
            var deletingNode: Node! = tempNode?.nextNode
            tempNode?.nextNode = deletingNode?.nextNode
            deletingNode = nil
            
            return true
        }else{
            print("Error: position doesn't exist.")
            return false
        }
    }
    
    func allValues() -> Array<Int> {
        var array: Array<Int> = [Int]()
        var tempNode = headNode
        for _ in 0...(count()-1){
           array.append((tempNode?.value)!)
           tempNode = tempNode?.nextNode
        }
        return array
    }
}


