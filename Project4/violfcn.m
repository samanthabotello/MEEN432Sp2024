function viol = violfcn(regen, v)
    speed = (3600/1600)*v;
    if speed < 5
        regen_vio = 0;
        if regen == regen_vio
            viol = 0;
        else
            viol = 1;
        end

    elseif speed == 25
        regen_vio = 0.95;
        if regen == regen_vio
            viol = 0;
        else
            viol = 1;
        end

    elseif v > 25
        regen_vio = 0.95;
        if regen == regen_vio
            viol = 0;
        else
            viol = 1;
        end
    else
        regen_vio = ((0.95/20)*speed) - 0.2375;
        if regen == regen_vio
            viol = 0;
        else
            viol = 1;
        end
    end