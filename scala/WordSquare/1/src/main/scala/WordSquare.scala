package com.mikekrisher.word_square

import util.control.Breaks._

class WordSquare(words: List[String]) {
  var matchedWords : List[String] = List()

  def process : Boolean = 
  {
    matchedWords = List(matchedWords ++ List(words(0))).flatten

    val remainingWords = words.drop(1)

    for (i <- 0 to (remainingWords.size - 1)) 
    {
      if (matchedWords.size < 4) {
        val wordMatch = checkWords(matchedWords, remainingWords, matchedWords.size)
      }

      if (matchedWords.size == 4) {
        println("A WordSquare can be created with: ")
        for (j <- 0 to (matchedWords.size - 1))
        {
          println(matchedWords(j))
        }
        return true
      } 
    }

    return false
  }

  def checkWords(matchingWords: List[String], inputWords: List[String], position: Int) : Boolean = 
  {
    val search = searchString(matchingWords, position)

    for (i <- 0 to (inputWords.size - 1))
    {
      val inputWord = inputWords(i)

      breakable {
        if (matchingWords.contains(inputWord)) {
          break
        }
      }

      val inputWordSub = inputWord.substring(0, matchingWords.size)

      breakable {
        if (inputWordSub == search) {
          matchedWords = List(matchedWords ++ List(inputWord)).flatten
          return true
        }
      }
    }

    return false
  }

  def searchString(matchingWords: List[String], position: Int) : String =
  {
    var search = "";

    for (i <- 0 to (matchingWords.size - 1)) 
    {
      val subString = matchingWords(i).substring(position, position + 1)
      search = search.concat(subString)
    }

    return search
  }
}

