/*
You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.
*/

func rob(_ nums: [Int]) -> Int {
    if nums.count == 0 { return 0 }
    if nums.count == 1 { return nums[0] }
    if nums.count == 2 { return max(nums[0], nums[1]) }
    var table: [Int] = Array(repeating: 0, count: nums.count)
    table[0] = nums[0]
    table[1] = max(nums[0], nums[1])
    for i in 2..<table.count {
        table[i] = max(table[i - 1], table[i - 2] + nums[i])
    }
    return table[table.count - 1]
}