import org.scalatest.{FunSpec, BeforeAndAfter, Matchers}
import com.mikekrisher.word_square._

class WordSquareTest extends FunSpec with BeforeAndAfter with Matchers {

  val words   = List("ball", "food", "lady", "lead", "area")
  var subject = new WordSquare(words)

  describe("WordSquare#process") {
    describe("with words that can be used to form a square") {
      it("should return true") {
        assert(subject.process == true)
      }
    }

    describe("with words that can NOT be used to form a square") {
      it("should return false") {
        val words   = List("ball", "food", "street", "lead", "area")
        var subject = new WordSquare(words)
        assert(subject.process == false)
      }
    }
  }

  describe("WordsSquare#checkWords") {
    it("should return true if an input word can be used as the next word in the square") {
      val matchingWords = List(words(0))
      val inputWords    = words.takeRight(4)
      val position      = 1
      val result        = subject.checkWords(matchingWords, inputWords, position)

      assert(result == true)
    }
  }

  describe("WordsSquare#searchString") {
    describe("with only one matching word") {
      it("returns a substring containing the character for each matched word at a given position") {
        val matchingWords = List("ball")
        val position      = 1 // second charcter of the word

        assert(subject.searchString(matchingWords, position) == "a")
      }
    }

    describe("with two matching words") {
      it("returns a substring containing the character for each matched word at a given position") {
        val matchingWords = List("ball", "area")
        val position      = 1 // second charcter of the word

        assert(subject.searchString(matchingWords, position) == "ar")
      }
    }
  }
}

