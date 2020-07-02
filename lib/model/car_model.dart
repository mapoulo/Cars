class Cars{

  String carName;
  String carImage;
  String description;
  String founder;
  Cars({this.carName, this.carImage, this.description, this.founder});
}

List<Cars> carList = [

  Cars(carImage: "assets/images/1.jpg", description: "", founder: "", carName: ""),
   Cars(carImage: "assets/images/2.jpg", description: "", founder: "", carName: ""),
    Cars(carImage: "assets/images/3.jpg", description: "Automobiles Ettore Bugatti was a French car manufacturer of high-performance automobiles, founded in 1909 in the then-German city of Molsheim, Alsace by the Italian-born industrial designer Ettore Bugatti. The cars were known for their design beauty and for their many race victories", founder: "Ettore Bugatti", carName: "Bugatti"),
     Cars(carImage: "assets/images/4.jpg", description: "", founder: "", carName: ""),
      Cars(carImage: "assets/images/5.jpg", description: "", founder: "", carName: ""),
       Cars(carImage: "assets/images/6.jpg", description: "", founder: "", carName: ""),
        
];