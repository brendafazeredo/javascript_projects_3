const pool = require('../conexao');

const listarLivros = async (req, res) => {
	try {
		const query = `
            select l.id, l.nome, l.genero, l.editora, l.data_publicacao,
            l.autor_id, a.nome as autor_nome, a.idade as autor_idade 
            from livros l left join autores a 
            on l.autor_id = a.id
        `;

		const {rows} = await pool.query(query);

		const livros = rows.map(livro => {
			const {autor_id, autor_nome, autor_idade, ...dadosLivro} = livro;
			return {
				...dadosLivro,
				autor: {
					id: autor_id,
					nome: autor_nome,
					idade: autor_idade,
				},
			};
		});

		return res.json(livros)
	} catch (error) {
		return res.status(500).json({mensagem: 'Erro interno do servidor.'})
	};
};

module.exports = {
	listarLivros,
};