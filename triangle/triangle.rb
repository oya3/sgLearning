# -*- coding: utf-8 -*-

# $ ruby triangle.rb 2, 3, 4
# 不等辺三角形ですね！
# $ ruby triangle.rb 2, 2, 1
# 二等辺三角形ですね！
# $ ruby triangle.rb 1, 1, 1
# 正三角形ですね！
# $ ruby triangle.rb 1, 2, 3
# 三角形じゃないです＞＜
class Triangle
    def self.whatTriangle(a,b,c)
        if( (a < (b+c)) && (b < (a+c)) && (c < (a+b)) ) then # 三角形成立条件
            if( (a==b) && (b==c) ) then # 正三角形=3辺が同じ長さ
                return "正三角形ですやん"
            elsif( (a==b) || (b==c) || (c==a) ) then # 二等辺三角形の判定=2辺が同じ長さ
                return "二等辺三角形ですやん"
            end
            return "不等辺三角形ですやん"
        end
        return "三角形じゃないやん＞＜"
    end
end

puts Triangle.whatTriangle(ARGV[0].to_i,ARGV[1].to_i,ARGV[2].to_i)

