import 'package:flutter/material.dart';

class PetsList {
  List<dynamic> details = [
    {
      "name": 'DOG'.toString(),
      "images": const NetworkImage(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkCFvNt8NMeobg5oxu0NvtYQy1bpXV-jY0aw&usqp=CAU")
    },
    {
      "name": 'CAT'.toString(),
      "images": const NetworkImage(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTju-m800LVW_MIDgey6pyaichNlvn7Uscaqw&usqp=CAU",
      )
    },
    {
      "name": 'BIRDS'.toString(),
      "images": const NetworkImage(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxIw2P3t3souW-aD_8QPbaZw_xsEqlkV77Ig&usqp=CAU",
      )
    },

    {
      "name": "FISH".toString(),
      "images": const NetworkImage(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwdneP86fyUOmz8jLqNmuOCLq-l_fs39fnuA&usqp=CAU",
      )
    },
    {
      "name": "SMALL ANIMALS".toString(),
      "images": const NetworkImage(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP7k-CsNZ_n4V-PJiM8lD_Jj0vy73nSJO57g&usqp=CAU")
    }
  ];

  List<dynamic> offers = [
    {
      "images": const NetworkImage(
          "https://getvetco.com/wp-content/uploads/2022/07/dogdryoffchange-pichi.jpg")
    },
    {
      "images": const NetworkImage(
          "https://getvetco.com/wp-content/uploads/2022/12/new-chew-toycorr1-1.jpg.webp")
    },
    {
      "images": const NetworkImage(
          "https://getvetco.com/wp-content/uploads/2022/07/tickfleaoffchange-pichi.jpg.webp")
    },
  ];

  List<dynamic> starting = [
    {
      "images": const NetworkImage(
          "https://media.istockphoto.com/photos/big-group-of-pets-picture-id531708303"),
    },
    {
      "images": const NetworkImage(
          "https://th.bing.com/th/id/OIP.t4ayhlBsLaCEfv0eWBbiUAHaEo?pid=ImgDet&rs=1")
    },
    {
      "images": const NetworkImage(
          "https://www.furservicesfurpets.com/wp-content/uploads/2019/04/41757008_xl_25.jpg")
    },
    {
      "images": const NetworkImage(
          "https://jimdo-storage.freetls.fastly.net/image/55806433/fc4952b8-6be5-40c9-a62b-59bf51571563.jpg?format=pjpg&quality=80&auto=webp&disable=upscale&width=1200&height=630&crop=1:0.525")
    },
  ];
}
