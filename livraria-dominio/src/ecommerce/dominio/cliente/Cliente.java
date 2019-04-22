package ecommerce.dominio.cliente;
import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.Perfil;
import java.util.Date;

/**
 *
 * @author matheus
 */
public class Cliente extends EntidadeDominio{
    private Integer id;
    private String nome;
    private String sobrenome;
    private Date data_nascimento;
    private boolean status;
    private String sexo;
    private double ranking;
    private Endereco endereco;
    private Telefone telefone;
    private Cartao cartao;
    private String email;
    private String senha;
    private String confirmarSenha;
    private String cpf;
    private String rg;
    private Perfil papel;


    
    public Cliente(Integer id, String nome, String sobrenome, boolean status, String sexo, Date data_nascimento, double ranking, Perfil papel){
        super();
        this.nome = nome;
        this.id = id;
        this.sobrenome = sobrenome;
        this.status = status;
        this.sexo = sexo;
        this.data_nascimento = data_nascimento;
        this.ranking = ranking;
        this.papel = papel;
        
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public Cliente(){
        endereco = new Endereco();
        telefone = new Telefone();
        papel = new Perfil();
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public Date getData_nascimento() {
        return data_nascimento;
    }

    public void setData_nascimento(Date data_nascimento) {
        this.data_nascimento = data_nascimento;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public double getRanking() {
        return ranking;
    }

    public void setRanking(double ranking) {
        this.ranking = ranking;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public Telefone getTelefone() {
        return telefone;
    }

    public void setTelefone(Telefone telefone) {
        this.telefone = telefone;
    }

    public Cartao getCartao() {
        return cartao;
    }

    public void setCartao(Cartao cartao) {
        this.cartao = cartao;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getConfirmarSenha() {
        return confirmarSenha;
    }

    public void setConfirmarSenha(String confirmarSenha) {
        this.confirmarSenha = confirmarSenha;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }
    
    public Perfil getPapel() {
        return papel;
    }

    public void setPapel(Perfil papel) {
        this.papel = papel;
    }

}
