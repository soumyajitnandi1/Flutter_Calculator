import 'package:flutter/material.dart';


void main() => runApp(Calculator());

class Calculator extends StatefulWidget 
{
  @override
  State<StatefulWidget> createState() {
    return CalculatorState();
  }
}

class CalculatorState extends State<Calculator>
{
  var disp="0.0";
  var n1="0";
  var n2="0";
  var st=true;
  String op;
  void press(String x)
  {
    setState(() {
      if (x=="CLR")
      {
        disp="0.0" ;
        n1="0";
        n2="0";
        st=true;
        op=null;
      }
      else if(x=="ANS")
      {
        if (n1.contains(".") || n2.contains("."))
        {
          var nm1=double.parse(n1);
          var nm2=double.parse(n2);
          if(op=="+")
            disp=(nm1+nm2).toString();
          else if(op=="-")
            disp=(nm1-nm2).toString();
          else if(op=="×")
            disp=(nm1*nm2).toString();
          else if(op=="÷")
            disp=(nm1/nm2).toString();
        }
        else 
        {
          var nm1=int.parse(n1);
          var nm2=int.parse(n2);
          if(op=="+")
            disp=(nm1+nm2).toString();
          else if(op=="-")
            disp=(nm1-nm2).toString();
          else if(op=="×")
            disp=(nm1*nm2).toString();
          else if(op=="÷")
            disp=(nm1/nm2).toString();
        }
        n1=disp;
        n2="0";
        st=true;
        op=null;
      }
      else
      {
        if(disp=="0.0" || disp=="0")
          disp=x;
        else
          disp+=x;
        if (x=="+" || x=="-" || x=="×" || x=="÷")
        {
          st=false;
          op=x;
        }
        else
          if(st)
          {
            if(n1=="0")
              n1=x;
            else
              n1+=x;
          }
          else
          {
            if(n2=="0")
              n2=x;
            else
              n2+=x;
          }
      }
    });
    print("'$x' PRESSED, n1 = $n1, Operand = '$op', n2 = $n2");
  }


  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      theme: 
        ThemeData(primaryColor: Colors.green[400]),
      home: 
        Scaffold
        (
          appBar: 
            AppBar
            (centerTitle: true,title: Text("Calculator"),),
          body: 
            Container
            (child: 
              Column
              (children: 
                [
                  Container
                  (margin: EdgeInsets.only(bottom: 113),child: 
                    Align(alignment: Alignment.topRight,child :Text("$disp",style: TextStyle(fontSize: 70),),),
                  ),
                  Container
                  (color: Colors.black,child: Column
                    (children: 
                      [ Row
                        (children: 
                          [ Expanded(child: RaisedButton(padding: EdgeInsets.all(20),child: Text("1",style: TextStyle(fontSize: 40),),onPressed: () => press("1"),color: Colors.blue,)),
                            Expanded(child: RaisedButton(padding: EdgeInsets.all(20),child: Text("2",style: TextStyle(fontSize: 40),),onPressed: () => press("2"),color: Colors.blue,)),
                            Expanded(child: RaisedButton(padding: EdgeInsets.all(20),child: Text("3",style: TextStyle(fontSize: 40),),onPressed: () => press("3"),color: Colors.blue,)),
                            Expanded(child: RaisedButton(padding: EdgeInsets.all(20),child: Text("+",style: TextStyle(fontSize: 40),),onPressed: () => press("+"),color: Colors.orange,)),
                          ],
                        ),
                      Row
                        (children: 
                          [ Expanded(child: RaisedButton(padding: EdgeInsets.all(20),child: Text("4",style: TextStyle(fontSize: 40),),onPressed: () => press("4"),color: Colors.blue,)),
                            Expanded(child: RaisedButton(padding: EdgeInsets.all(20),child: Text("5",style: TextStyle(fontSize: 40),),onPressed: () => press("5"),color: Colors.blue,)),
                            Expanded(child: RaisedButton(padding: EdgeInsets.all(20),child: Text("6",style: TextStyle(fontSize: 40),),onPressed: () => press("6"),color: Colors.blue,)),
                            Expanded(child: RaisedButton(padding: EdgeInsets.all(20),child: Text("-",style: TextStyle(fontSize: 40),),onPressed: () => press("-"),color: Colors.orange,)),
                          ],
                        ),
                      Row
                        (children: 
                          [ Expanded(child: RaisedButton(padding: EdgeInsets.all(20),child: Text("7",style: TextStyle(fontSize: 40),),onPressed: () => press("7"),color: Colors.blue,)),
                            Expanded(child: RaisedButton(padding: EdgeInsets.all(20),child: Text("8",style: TextStyle(fontSize: 40),),onPressed: () => press("8"),color: Colors.blue,)),
                            Expanded(child: RaisedButton(padding: EdgeInsets.all(20),child: Text("9",style: TextStyle(fontSize: 40),),onPressed: () => press("9"),color: Colors.blue,)),
                            Expanded(child: RaisedButton(padding: EdgeInsets.all(20),child: Text("×",style: TextStyle(fontSize: 40),),onPressed: () => press("×"),color: Colors.orange,)),
                          ],
                        ),
                      Row
                        (children: 
                          [ Expanded(child: RaisedButton(padding: EdgeInsets.all(20),child: Text("0",style: TextStyle(fontSize: 40),),onPressed: () => press("0"),color: Colors.blue,)),
                            Expanded(child: RaisedButton(padding: EdgeInsets.all(20),child: Text(".",style: TextStyle(fontSize: 40),),onPressed: () => press("."),color: Colors.blue,)),
                            Expanded(child: RaisedButton(padding: EdgeInsets.all(20),child: Text("00",style: TextStyle(fontSize: 40),),onPressed: () => press("00"),color: Colors.blue,)),
                            Expanded(child: RaisedButton(padding: EdgeInsets.all(20),child: Text("÷",style: TextStyle(fontSize: 40),),onPressed: () => press("÷"),color: Colors.orange,)),
                          ],
                        ),
                      Row
                        (children: 
                          [ Expanded(child: RaisedButton(padding: EdgeInsets.only(top: 13),child: Text("CLR",style: TextStyle(fontSize: 40),),onPressed: () => press("CLR"),color: Colors.red,)),
                            Expanded(child: RaisedButton(padding: EdgeInsets.only(top: 13),child: Text("ANS",style: TextStyle(fontSize: 40),),onPressed: () => press("ANS"),color: Colors.green,)),
                          ],
                        ),
                      ],
                    ) 
                  )
                ]
              )
            )
        )
    );
  }
}