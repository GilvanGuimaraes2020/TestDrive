/* 
Gera um objeto contendo o id e nome da cor */

class ListaCor{
  String colorid= '';
  String cor = '';

  ListaCor();

ListaCor.fromJson(Map<String , dynamic> map){
  colorid = map['color_id'];
  cor = map['name'];
}

}