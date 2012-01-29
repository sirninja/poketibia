blacksmith = {
	credits = true, -- Adicionar "criado por" na descrição do item?
	variance = {-2, 2}, -- Os atributos serão aleatorizados entre X e Y
	rareConfig = {
		stone = 8306, -- Item que transforma as receitas em receitas épicas :)
		chance = 1000, -- A chance da receita épica funcionar? (Padrão: 10%)
		bonus = 6 -- Se a receita épica funcionar, o item receberá um bônus de?
	}
}

forges = {     
	[2147] = { -- o item que será feito
		recipe = {{5901, 1}}, -- a receita do item
		chance = 1000 -- chance do item dar certo (100% = 1000, 1% = 10, 0.5% = 5 e etc)
	}
}