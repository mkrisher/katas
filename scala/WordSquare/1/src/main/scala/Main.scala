package com.mikekrisher.word_square
import com.mikekrisher.word_square._

object Main {
  def main(args: Array[String]) {
    val words = List("ball", "food", "lady", "lead", "area")
    //val words = List("card", "area", "rear", "dart")

    val wordSquare = new WordSquare(words)
    val result     = wordSquare.process

    if (result == false)
      println("a wordsquare can not be created")

  }
}

