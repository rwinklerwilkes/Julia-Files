function calc_area(l, w, h)
    front = w*h;
    side = h*l;
    bottom = l*w;
    area = 2*(front + side + bottom);
    extra = min(front, side, bottom);
    return area + extra
end

function calc_ribbon(l,w,h)
    shape_sort = sort([l,w,h])
    ribbon = 2*shape_sort[1] + 2*shape_sort[2];
    extra = l*w*h;
    return ribbon + extra;
end

s = open("aoc_2015_day2_input.txt") do file
    readlines(file)
end;

function calculate_paper_needed(lines)
    total_area = 0;
    for dimensions in lines
        shapes = [parse(Int64,x) for x=split(dimensions,"x")];
        area_needed = calc_area(shapes...);
        total_area += area_needed;
    end
    return total_area;
end

function calculate_ribbon_needed(lines)
    total_ribbon = 0;
    for dimensions in lines
        shapes = [parse(Int64,x) for x=split(dimensions,"x")];
        area_needed = calc_ribbon(shapes...);
        total_ribbon += area_needed;
    end
    return total_ribbon;
end
