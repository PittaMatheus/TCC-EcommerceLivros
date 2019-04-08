package br.com.fatecmogidascruzes.CRUDCLIENTE.dominio;
import java.util.List;


/**
 *
 * @author bocao
 */
public class Livro extends EntidadeDominio {
    
    private Integer Id;
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

    public Integer getId() {
        return Id;
    }

    public void setId(Integer Id) {
        this.Id = Id;
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

    @Override
    public String toString() {
        return "Livro{" + "autor=" + autor + ", codigoBarras=" + codigoBarras + ", titulo=" + titulo + ", edicao=" + edicao + ", sinopse=" + sinopse + ", numeroPaginas=" + numeroPaginas + ", ano=" + ano + ", categorias=" + categorias.get(0).getNome() + ", categorias ID =" + categorias.get(0).getId()
                + ", dimensoes ID =" + dimensoes.getId() + ", dimensoes altura=" + dimensoes.getAltura() + ", dimensoes largura=" + dimensoes.getLargura() + ", dimensoes peso=" + dimensoes.getPeso() + ", dimensoes profundidade=" + dimensoes.getProfundidade()
                + ", editora ID =" + editora.getId() + ", editora=" + editora.getNome()
                + ", grupoLivro ID =" + grupoLivro.getId() + ", grupoLivro=" + grupoLivro.getNome() + ", grupoLivro margem_lucro=" + grupoLivro.getMargemLucro()
                + ", isbn ID =" + isbn.getId() + ", isbn=" + isbn.getCodBarras() + ", preco=" + preco + ", ativo=" + ativo + '}';
    }
    
}
