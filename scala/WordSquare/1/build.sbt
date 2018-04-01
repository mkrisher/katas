lazy val root = (project in file(".")).
  settings(
    inThisBuild(List(
      organization := "com.mikekrisher",
      scalaVersion := "2.12.4"
    )),
    name    := "word_square",
    version := "0.1-SNAPSHOT"
  )

libraryDependencies += "org.scalatest" %% "scalatest" % "3.0.5" % Test

