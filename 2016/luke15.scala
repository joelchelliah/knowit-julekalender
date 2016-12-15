object Luke15 {
	def lookAndSay(i: Int, nums: String): String =
		if (i == 0) nums
		else lookAndSay(i-1, expand(nums).mkString)

	def expand(nums: String) =
		nums.foldRight(List.empty[(Int, String)])((n, acc) => acc match {
			case (h :: t) if h._2 == n.toString => (h._1 + 1, h._2) :: t
			case _ => (1, n.toString) :: acc
		}) flatMap (_.productIterator.toList)

	def main(args:Array[String]) = println(lookAndSay(50, "1111321112321111").length)
}
