// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
import 'package:app_projeto_cardapio/model/cardapio.dart';
import 'package:app_projeto_cardapio/service/cardapio_service.dart';
import 'package:flutter/material.dart';

class DetalhesView extends StatefulWidget {
  final MenuItem menuItem;
  final Cart cart;

  DetalhesView({required this.menuItem, required this.cart});

  @override
  _DetalhesViewState createState() => _DetalhesViewState();
}

class _DetalhesViewState extends State<DetalhesView> {
  int quantidade = 1; // Quantidade padrão inicial como 1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.menuItem.name, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 96, 28, 16),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/cor.jpeg'), 
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Imagem do item
                  Card(
                    elevation: 5,
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        widget.menuItem.imagem,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Descrição
                  Text(
                    widget.menuItem.description,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),

                  // Preço
                  Text(
                    'Preço: R\$ ${widget.menuItem.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Ajuste da quantidade
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (quantidade > 1) quantidade--;
                          });
                        },
                        icon: Icon(Icons.remove_circle),
                        color: const Color.fromARGB(255, 96, 28, 16),
                      ),
                      Text(
                        quantidade.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            quantidade++;
                          });
                        },
                        icon: Icon(Icons.add_circle),
                        color: const Color.fromARGB(255, 96, 28, 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Botão "Adicionar ao Carrinho"
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                      backgroundColor: const Color.fromARGB(255, 96, 28, 16),
                    ),
                    onPressed: () {
                      for (int i = 0; i < quantidade; i++) {
                        widget.cart.addItem(widget.menuItem);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              '${widget.menuItem.name} adicionado ao carrinho com quantidade $quantidade'),
                        ),
                      );
                    },
                    child: Text(
                      'Adicionar ao Carrinho',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
