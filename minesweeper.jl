
field = 8
mines = 9
game_over = false
i=0

print("Choose type of grid:\n")
println("1. 8x8 grid with 9 mines")
println("2. 16x16 grid with 20 mines")
level = string(readline())

if level === "1"
    global field = 8
    global mines = 9
elseif level === "2"
    global field = 16
    global mines = 20
end

global minesArray = zeros(Int32, field, field)
global board = (String, field, field)
board = fill("X", field, field)

function DisplayGrid()
    for i=1:field*field
        print(board[i], " ")
        if(mod(i,field)==0)
           print("\n")  
        end
    end
end

function Turn()
    println("""Do you want to "mine" or "flag"?""")
    global choice = string(readline())
    println("Type the x coordinate of the cell you want to check.")
    global cellx = string(readline())
    cellx = parse(Int, cellx)
    println("Type the y coordinate of the cell you want to check.")
    global celly = string(readline())
    celly = parse(Int, celly)
    
    if(choice=="mine")
        if(minesArray[cellx,celly]==1)
            board[cellx, celly] = "M"
            global game_over = true
            println("Lose")
            
            elseif(minesArray[cellx,celly]==0 && cellx!=1 && cellx!=8 && celly!=1 && celly!=8)
                neighbor = 0
                
                if(minesArray[cellx-1, celly-1]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx-1, celly]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx-1, celly+1]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx, celly-1]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx, celly+1]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx+1, celly-1]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx+1, celly]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx+1, celly+1]==1)
                    neighbor = neighbor+1
                end
            
                board[cellx, celly] = string(neighbor)
            
            elseif(minesArray[cellx,celly]==0 && cellx==1 && celly!=1 && celly!=8)
                neighbor = 0
            
                if(minesArray[cellx, celly-1]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx, celly+1]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx+1, celly-1]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx+1, celly]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx+1, celly+1]==1)
                    neighbor = neighbor+1
                end
            
                board[cellx, celly] = string(neighbor)
            
            elseif(minesArray[cellx,celly]==0 && cellx==8 && celly!=1 && celly!=8)
                neighbor = 0
            
                if(minesArray[cellx, celly-1]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx, celly+1]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx-1, celly-1]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx-1, celly]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx-1, celly+1]==1)
                    neighbor = neighbor+1
                end
            
                board[cellx, celly] = string(neighbor)
            
            elseif(minesArray[cellx,celly]==0 && celly==1 && cellx!=1 && cellx!=8)
                neighbor = 0
            
                if(minesArray[cellx-1, celly]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx-1, celly]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx-1, celly+1]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx, celly]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx, celly+1]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx+1, celly]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx+1, celly]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx+1, celly+1]==1)
                    neighbor = neighbor+1
                end
            
            
                board[cellx, celly] = string(neighbor)
            
            elseif(minesArray[cellx,celly]==0 && celly==8 && cellx!=8 && cellx!=1)
                neighbor = 0
            
                if(minesArray[cellx-1, celly]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx-1, celly]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx-1, celly-1]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx, celly]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx, celly-1]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx+1, celly]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx+1, celly]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx+1, celly-1]==1)
                    neighbor = neighbor+1
                end
            
            
                board[cellx, celly] = string(neighbor)
            
            elseif(minesArray[cellx,celly]==0 && cellx==1 && celly==1)
                neighbor = 0
            
                if(minesArray[cellx+1, celly+1]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx+1, celly]==1)
                    neighbor = neighbor+1
                end
                
                if(minesArray[cellx, celly+1]==1)
                    neighbor = neighbor+1
                end
            
                board[cellx, celly] = string(neighbor)
            
            elseif(minesArray[cellx,celly]==0 && cellx==8 && celly==1)
                neighbor = 0
            
                if(minesArray[cellx-1, celly+1]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx-1, celly]==1)
                    neighbor = neighbor+1
                end
                
                if(minesArray[cellx, celly+1]==1)
                    neighbor = neighbor+1
                end
            
                board[cellx, celly] = string(neighbor)
            
            elseif(minesArray[cellx,celly]==0 && cellx==1 && celly==8)
                neighbor = 0
            
                 if(minesArray[cellx+1, celly-1]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx+1, celly]==1)
                    neighbor = neighbor+1
                end
                
                if(minesArray[cellx, celly-1]==1)
                    neighbor = neighbor+1
                end
            
                board[cellx, celly] = string(neighbor)
            
            elseif(minesArray[cellx,celly]==0 && cellx==8 && celly==8)
                neighbor = 0
            
                 if(minesArray[cellx-1, celly-1]==1)
                    neighbor = neighbor+1
                end
            
                if(minesArray[cellx-1, celly]==1)
                    neighbor = neighbor+1
                end
                
                if(minesArray[cellx, celly-1]==1)
                    neighbor = neighbor+1
                end
            
                board[cellx, celly] = string(neighbor)
        end
        
        elseif(choice == "flag")
        board[cellx,celly] = "F"
    end
end


function AddMines()
    
    for i=1:mines
        function Draw()
            global x = rand(1:field)
            global y = rand(1:field)
        end
        
        Draw()
        while(minesArray[x,y] == 1)
            Draw()
        end
        if(minesArray[x,y] == 0)
            minesArray[x, y] = 1
        end
    end
end

AddMines()
while(game_over == false)
    DisplayGrid()
    Turn()
    println("\n")
    i=i+1
    if(i==64 && field == 8)
       gameover==true
        println("Win!")
    end
    
    if(i==256 && field == 16)
       gameover==true
        println("Win!")
    end
end
DisplayGrid()
for i=1:field
    for j=1:field
        if(minesArray[i,j]==1)
            board[i,j]=="M"
        end
    end
end
println("\n")
DisplayGrid()








