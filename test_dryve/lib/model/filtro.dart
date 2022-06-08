import 'package:flutter/cupertino.dart';

/* classe com  os notifylisteners, 
gerenciador dos filtros
contador de quantidade de filtros aplicados */

class Filtro extends ChangeNotifier{
  int quantidade = 0; //contador de filtros
  List<String>? marca = [];//armazena marca
  List<String>? corId = [];//armazena id das cores
  String? nome; //armazena nome
  bool isFilter = false; //verificador de filtro
  bool favoriteCar = false; //verifica se carro será favoritado
  List<String?> idFavorite = []; //armazena a lista de carros favoritos
  Filtro();

/* gerencia o filtro das marcas quando este é selecionado add ou remove itens*/
void atualizaMarca(String marca , bool checked){
  
  if (checked){    
    this.marca?.add(marca);
  } else{
    this.marca?.remove(marca);
  }
  
  int filtMarca = this.marca!.length;
  int filtCor = corId!.length ;

/* 
contabiliza os filtros selecionados  */
  quantidade = filtMarca + filtCor;
/* notifica os cosumers de mudanças */
  notifyListeners();
}

/* gerencia os filtros de cores add ou remove itens */
void atualizaCor(String cor , bool checked){
  if (checked){    
    
    corId?.add(cor);
  } else{
    corId?.remove(cor);
  } 

   int filtMarca = marca!.length;
  int filtCor = corId!.length ;

  quantidade = filtMarca + filtCor;

  notifyListeners();
}

/*seta isFilter e coleta valor do campo de texto nome
do homepage_drawer para executar funçao de filtro de homepage  */
filtrarElementos(bool isFilter, String nome){
 
  this.nome = nome;
 this.isFilter = isFilter;
 notifyListeners();

}

/* limpa todos os filtros */
limpaFiltros(){
  corId!.clear();
  marca!.clear();
  quantidade = 0;
  isFilter = false;

notifyListeners();
}

/* funçao para add ou remove itens da lista de carros favoritos */
favoritaCarro(String? id){
  favoriteCar = true;
  if (idFavorite.contains(id)){    
    idFavorite.remove(id);
  } else{
    idFavorite.add(id);
  }
  
  notifyListeners();
}
  
}