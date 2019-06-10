package ecommerce.dominio.livro;
import ecommerce.dominio.EntidadeDominio;
import java.util.List;


/**
 *
 * @author bocao
 */
public class Livro extends EntidadeDominio {
    
    private Integer id;
    private String autor;
    private String codigoBarras;
    private String titulo;
    private String edicao;
    private String sinopse;
    private String numeroPaginas;
    private String ano;
    private List<Categoria> categorias;
    private Dimensoes dimensoes;
    private Editora editora;
    private GrupoLivro grupoLivro;
    private ISBN isbn;
    private Double preco;
    private Boolean ativo;
    private String imagem;
    private String acao;
    private Categoria categoria;

    public Livro(Integer Id, String autor,String codigoBarras,String titulo,String edicao, String sinopse, String numeroPaginas, String ano,
     List<Categoria> categorias,Dimensoes dimensoes,Editora editora, GrupoLivro grupoLivro, ISBN isbn, Double preco, Boolean ativo, String imagem,
      String acao){
        super();
        this.id = id;
        this.autor = autor;
        this.codigoBarras = codigoBarras;
        this.titulo = titulo;
        this.edicao = edicao;
        this.sinopse = sinopse;
        this.numeroPaginas = numeroPaginas;
        this.ano = ano;
        this.categorias = categorias;
        this.dimensoes = dimensoes;
        this.editora = editora;
        this.categorias = categorias;
        this.grupoLivro = grupoLivro;
        this.isbn = isbn;
        this.preco = preco;
        this.ativo = ativo;
        this.imagem = imagem;
        this.acao = acao;
        
    }
    
    
    public Livro(){
        editora = new Editora();
        isbn = new ISBN();
        dimensoes = new Dimensoes();
        grupoLivro = new GrupoLivro();
        categoria = new Categoria();
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer Id) {
        this.id = Id;
    }

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }
    
    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getCodigoBarras() {
        return codigoBarras;
    }

    public void setCodigoBarras(String codigoBarras) {
        this.codigoBarras = codigoBarras;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getEdicao() {
        return edicao;
    }

    public void setEdicao(String edicao) {
        this.edicao = edicao;
    }

    public String getSinopse() {
        return sinopse;
    }

    public void setSinopse(String sinopse) {
        this.sinopse = sinopse;
    }

    public String getNumeroPaginas() {
        return numeroPaginas;
    }

    public void setNumeroPaginas(String numeroPaginas) {
        this.numeroPaginas = numeroPaginas;
    }

    public List<Categoria> getCategorias() {
        return categorias;
    }

    public String getAcao() {
        return acao;
    }

    public void setAcao(String acao) {
        this.acao = acao;
    }

    
    public void setCategorias(List<Categoria> categorias) {
        this.categorias = categorias;
    }

    public Dimensoes getDimensoes() {
        return dimensoes;
    }

    public void setDimensoes(Dimensoes dimensoes) {
        this.dimensoes = dimensoes;
    }

    public Editora getEditora() {
        return editora;
    }

    public void setEditora(Editora editora) {
        this.editora = editora;
    }

    public GrupoLivro getGrupoLivro() {
        return grupoLivro;
    }

    public void setGrupoLivro(GrupoLivro grupoLivro) {
        this.grupoLivro = grupoLivro;
    }

    public ISBN getIsbn() {
        return isbn;
    }

    public void setIsbn(ISBN isbn) {
        this.isbn = isbn;
    }

    public Double getPreco() {
        return preco;
    }

    public void setPreco(Double preco) {
        this.preco = preco;
    }

    public Boolean getAtivo() {
        return ativo;
    }

    public void setAtivo(Boolean ativo) {
        this.ativo = ativo;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }
    

    @Override
    public String toString() {
        return "Livro{" + "autor=" + autor + ", codigoBarras=" + codigoBarras + ", titulo=" + titulo + ", edicao=" + edicao + ", sinopse=" + sinopse + ", numeroPaginas=" + numeroPaginas + ", ano=" + ano + ", categorias=" + categorias.get(0).getNome() + ", categorias ID =" + categorias.get(0).getId()
                + ", dimensoes ID =" + dimensoes.getId() + ", dimensoes altura=" + dimensoes.getAltura() + ", dimensoes largura=" + dimensoes.getLargura() + ", dimensoes peso=" + dimensoes.getPeso() + ", dimensoes profundidade=" + dimensoes.getProfundidade()
                + ", editora ID =" + editora.getId() + ", editora=" + editora.getNome()
                + ", grupoLivro ID =" + grupoLivro.getId() + ", grupoLivro=" + grupoLivro.getNome() + ", grupoLivro margem_lucro=" + grupoLivro.getMargemLucro()
                + ", isbn ID =" + isbn.getId() + ", isbn=" + isbn.getCodBarras() + ", preco=" + preco + ", ativo=" + ativo + '}';
    }
    
}
