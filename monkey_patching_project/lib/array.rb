# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        self.max - self.min
    end

    def average
        return nil if self.empty?
        self.sum / (self.length * 1.0)
    end

    def median
        return nil if self.empty?
        
        if self.length.odd?
            middle = self.length / 2
            return self.sort[middle]
        end

        if self.length.even?
            middle = self.length / 2
            first = self.sort[middle - 1]
            second = self.sort[middle]
            return (first + second) / 2.0
        end
    end

    def counts
        self.tally
    end

    def my_count(value)
        count = 0
        self.each do |e|
            if e == value
                count += 1
            end
        end
        count
    end

    def my_index(value)
        self.each.with_index do |e, i|
            if e == value
                return i      
            end
        end
        nil
    end

    def my_uniq()
        hash = Hash.new(0)
        self.each do |e|
            hash[e] += 1
        end
        hash.keys
    end

    def my_transpose
        arr = []
        (0...self.length).each do |row|
            mainrow = []
            (0...self.length).each do |column|
                mainrow << self[column][row]
            end
            arr << mainrow
        end
        arr
    end
end
