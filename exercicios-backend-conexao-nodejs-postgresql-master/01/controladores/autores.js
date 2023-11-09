const pool = require('../conexao');

const cadastrarAutor = async (req, res) => {
	const {nome, idade} = req.body;

	if (!nome) {
		return res.status(400).json({mensagem: 'O campo nome é obrigatório.'});
	};

	try {
		const query =
			'insert into autores (nome, idade) values ($1, $2) returning *'
		const { rows } = await pool.query(query, [nome, idade]);

		return res.status(201).json(rows[0]);
	} catch (error) {
		return res.status(500).json({ mensagem: 'Erro interno do servidor.'});
	};
};

const obterAutor = async (req, res) => {
	const {id} = req.params;

	try {
		const query = `
            select a.id, a.nome, a.idade, l.id as livro_id, l.nome as livro_nome,
            l.genero as livro_genero, l.editora as livro_editora, 
            l.data_publicacao as livro_data_publicacao 
            from autores a left join livros l 
            on a.id = l.autor_id where a.id = $1
        `;
		const { rowCount, rows } = await pool.query(query, [id]);

		if (rowCount === 0) {
			return res.status(404).json({mensagem: 'O autor não existe.'});
		};

		const livros = rows.map(livro => {
			return {
				id: livro.livro_id,
				nome: livro.livro_nome,
				genero: livro.livro_genero,
				editora: livro.livro_editora,
				data_publicacao: livro.livro_data_publicacao,
			};
		});

		const autor = {
			id: rows[0].id,
			nome: rows[0].nome,
			idade: rows[0].idade,
			livros,
		};

		return res.json(autor);
	} catch (error) {
		return res.status(500).json({mensagem: 'Erro interno do servidor.'});
	};
};

const cadastrarLivroAutor = async (req, res) => {
	const {id} = req.params;
	const {nome, genero, editora, data_publicacao } = req.body;

	if (!nome) {
		return res.status(400).json({mensagem: 'O campo nome é obrigatório.'});
	};

	try {
		const {rowCount, rows} = await pool.query(
			'select * from autores where id = $1',
			[id]
		);

		if (rowCount === 0) {
			return res.status(404).json({mensagem: 'O autor não existe.'});
		};

		const autor = rows[0]

		const query = `
            insert into livros (autor_id, nome, genero, editora, data_publicacao)
            values ($1, $2, $3, $4, $5) returning *
        `;
		const livro = await pool.query(query, [
			autor.id,
			nome,
			genero,
			editora,
			data_publicacao,
		]);

		return res.status(201).json(livro.rows[0]);
	} catch (error) {
		return res.status(500).json({mensagem: 'Erro interno do servidor.'})
	};
};

module.exports = {
	cadastrarAutor,
	obterAutor,
	cadastrarLivroAutor,
};