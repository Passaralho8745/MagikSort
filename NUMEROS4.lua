numeros = {
    1,
    5,
    6,
    2,
    4
}

quantos = {}
separados = {}
reduzido = {}
organizada = {}



for i = 1, #numeros do
    n = numeros[i]
    if quantos[n] then
        quantos[n] = quantos[n] + 1
    else
        quantos[n] = 1
        table.insert(reduzido, n)
    end
end


maior = {1, reduzido[1], #reduzido}
menor = {1, reduzido[1]}

for i = 1, #reduzido do
    n = reduzido[i]
    if n > maior[2] then
        maior[1] = i
        maior[2] = n
    end
    if n < menor[2] then
        menor[1] = i
        menor[2] = n
    end
end



numeromagico = (maior[2] - menor[2])/#numeros


for i = 1, #reduzido do
    if separados[math.floor(reduzido[i]/numeromagico)] then
        table.insert(separados[math.floor(reduzido[i]/numeromagico)], reduzido[i])
    else
        separados[math.floor(reduzido[i]/numeromagico)] = {reduzido[i]}
    end
end



for i = math.floor(menor[2]/numeromagico), math.floor(maior[2]/numeromagico) do
    temp = separados[i]
    if temp then
        maior = {1, temp[1], #temp}
        menor = {1, temp[1]}
        while #temp > 0 do
            for j = 1, #temp do
                n = temp[j]
                if n < menor[2] then
                    menor[1] = j
                    menor[2] = n
                end
            end

            for i = 1, quantos[menor[2]] do
                table.insert(organizada, menor[2])
            end
            table.remove(temp, menor[1])

            maior = {1, temp[1], #temp}
            menor = {1, temp[1]}
        end
    end
end




for i = 1, #organizada do
    print(organizada[i])
end