# -*- coding: utf-8 -*-

require "pry"

class Eratos
    def self.getPrimeNumbers(inNumber)
        searchList = Array.new
        # ステップ１
        (2..inNumber).each do |i|
            searchList.push(i)
        end
        primeNumberList = Array.new
        # ステップ２、３
        while searchList[0] < Math.sqrt(inNumber) do
            targetNumber = searchList.shift
            # puts "targetNumber[#{targetNumber}]"
            # puts searchList.join(",")
            primeNumberList.push(targetNumber)
            tempArray = searchList.clone
            startIndex = 0
            tempNumber = targetNumber
            while (tempNumber += targetNumber) <= inNumber do
                (startIndex..(tempArray.size-1)).each do |i|
                    if( tempNumber < tempArray[i] ) then
                        break
                    end
                    if( tempNumber == tempArray[i] ) then
                        # puts "i=[#{i}],tempNumber=[#{tempNumber}],tempArray[#{i}]=[#{tempArray[i]}]"
                        tempArray.delete_at(i)
                        startIndex=i
                        break
                    end
                end
            end
            searchList = tempArray
        end
        primeNumberList.concat(tempArray)
    end
end

puts Eratos.getPrimeNumbers(ARGV[0].to_i).join(",")
