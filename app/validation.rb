class Validation

    def self.valid_position?(grid,pos_x,pos_y) # true or false si la posicion esta en la grilla ?
        valid_pos_x = pos_x >=0 && pos_x < grid.height
        valid_pos_y = pos_y >=0 && pos_y < grid.width
        valid_pos_x && valid_pos_y
    end
end