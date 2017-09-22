#include <iostream>

struct Node
{
  Node()
  {
    std::cout << "Node Created!" << std::endl;
  }
  ~Node()
  {
    std::cout << "Node Destroyed!" << std::endl;
  }
  int data;
  Node *next;

};

class List
{
  public:
  List()
  {
    head = NULL;
    tail = NULL;
  }
  void CreateNode(int wholeNumber)
  {
    Node *temp = new Node();
    temp->data = wholeNumber;
    temp->next = NULL;
    
    if (head == NULL)
    {
      head = temp;
      tail = temp;
      temp = NULL;
    }
    else
    {
      tail->next = temp;
      tail = temp;
    }
  }
  
  void DisplayList() 
  {
    Node *temp = new Node();
    temp = head;
    while (temp != NULL)
    {
      std::cout << temp->data << std::endl;
      temp = temp->next;
    }
  }
  
  private:
  Node *head, *tail;
};

int main() 
{
  List list1;
  list1.CreateNode(1);
  list1.CreateNode(3);
  list1.CreateNode(12);
  list1.CreateNode(4);
  list1.DisplayList();


  
  std::cout << "New linked list created" << std::endl;
}