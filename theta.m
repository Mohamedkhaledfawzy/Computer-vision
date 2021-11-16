function[angle]=theta(direction)


if(direction >= -22.5 && direction < 22.5)
            angle = 0;
        elseif(direction >= 22.5 && direction < 67.5)
            angle = 45;
        elseif(direction >= 67.5 && direction < 112.5)
            angle = 90;
        elseif(direction >= 112.5 && direction < 157.5)
            angle = 135;
        elseif(direction >= 157.5 || direction <-157.5)
            angle = 180;
        elseif(direction >= -157.5 && direction < -112.5)
            angle = -135;
        elseif(direction >= -112.5 && direction< -67.5)
            angle = -90;
        elseif(direction >= -67.5 && direction < -22.5)
            angle = -45;
end

end
