class Posto {
  int id;
  String nome;
  String pEt;
  String pGas;
  String data;
  String result;
  Posto();

  Posto.fromMap (Map map) {
    id =      map["cid"];
    nome =    map["cnome"];
    pEt =     map["cpEt"];
    pGas =    map["cpGas"];
    data =    map["cdata"];
    result =  map["cresult"];

  }

  Map toMap(){
    Map<String, dynamic>map = {
      //"cid": id,
      "cnome": nome,
      "cpEt": pEt,
      "cpGas": pGas,
      "cdata": data,
      "cresult": result,
    };
    if (id != null) {
      map["cid"] = id;
    }
    return map;
  }
  @override
  String toString( ){
    return
      "Posto{ id: $id, "
      "nome: $nome, "
      "pEt: $pEt, "
      "pGas: $pGas, "
      "data: $data, "
      "result: $result"
      "]";
  }
}


