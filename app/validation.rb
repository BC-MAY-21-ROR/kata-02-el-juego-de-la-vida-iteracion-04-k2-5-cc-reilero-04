class Validation
#This class contains all the validations for the game
    def self.valid_position?(grid,pos_x,pos_y) # true or false si la posicion esta en la grilla ?
        valid_pos_x = pos_x >=0 && pos_x < grid.height
        valid_pos_y = pos_y >=0 && pos_y < grid.width
        valid_pos_x && valid_pos_y
    end

    def self.alive_neighbors(cell)
        alive = cell.neighbors.select do |neighbor|
          neighbor.alive?
        end
        alive.size
    end

    def self.cell_will_live?(cell,num_alive_neighbors)
        (cell.alive?&&(num_alive_neighbors==2||num_alive_neighbors==3))||(!cell.alive?&&num_alive_neighbors==3)
    end

end