import UIKit

class Node {
    
    let value: Int
    var next: Node?
    
    init(value: Int, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
    func printNode(){
         print("[\(value)]")
    }
    
}

class LinkedList {
    
    var head: Node?
    
    init(node: Node) {
        self.head = node
    }
    
    convenience init(nodeValue: Int) {
        self.init(node: Node(value: nodeValue))
    }
    
    func addNewNode(value: Int) {
        let node = Node(value: value)
        guard var current: Node = self.head else {
            self.head = node
            return
        }
        while current.next != nil {
            current = current.next!
        }
        current.next = node
    }

    func reverceWithRecursion(_ node: Node? = nil) {
        if node?.next != nil {
            reverceWithRecursion(node?.next)
        }
        node?.printNode()
    }
    
    func reverceWithoutRecursion(_ node: Node? = nil) {
        var tempArray : [Node] = []
        var tempNode = node
        while tempNode != nil {
            tempArray.append(tempNode!)
            tempNode = tempNode?.next
        }
        tempArray.reversed().forEach { $0.printNode() }
    }


    func printReverseWithoutRecursion() {
        self.reverceWithoutRecursion(self.head)
    }
    
    func printReverseWithRecursion() {
        self.reverceWithRecursion(self.head)
    }
}

let list = LinkedList(nodeValue: 1)
list.addNewNode(value: 2)
list.addNewNode(value: 3)
list.printReverseWithoutRecursion()
list.printReverseWithRecursion()


