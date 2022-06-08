class Messages{
  String message = '';

  String informeMessage(type){

    switch (type){
      case "informacao":
    message = "Insira as Informaçoes";
    return message;
    
  case "login":
    message = "Insira sua senha";
    return message;

  case "pesquisa":
    message = "Busca por nome";
    return message;
    
  default:
    message = "";
    return message;
    }
  }



  
  
}