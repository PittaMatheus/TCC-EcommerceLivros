/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.teste;

import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.testng.annotations.*;
import static org.testng.Assert.*;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;

/**
 *
 * @author bocao
 */
public class TesteLivrariaAdmConducao {
    
    private WebDriver driver;
    private String baseUrl;
    private boolean acceptNextAlert = true;
    private StringBuffer verificationErrors = new StringBuffer();

    @BeforeClass(alwaysRun = true)
    public void setUp() throws Exception {
      String localChromeDriver = "/home/bocao/Documentos/6_sem/driversWeb/chromedriver_linux64_2/chromedriver";
      System.setProperty("webdriver.chrome.driver", localChromeDriver);
      driver = new ChromeDriver();
      driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
    }

    @Test
    public void testLivrariaAdmCond() throws Exception {
        driver.get("http://localhost:8080/Ecommerce/Livros/ListarLivros?acao=listar&status=1&menu=ok");
        driver.findElement(By.className("dropdown-button")).click();
        driver.findElement(By.linkText("Login")).click();
        driver.findElement(By.id("usuarioLogin")).click();
        driver.findElement(By.id("usuarioLogin")).clear();
        driver.findElement(By.id("usuarioLogin")).sendKeys("adm@adm.com");
        driver.findElement(By.name("acao")).click();
        driver.findElement(By.id("nav-mobile")).click();
        driver.findElement(By.partialLinkText("Gerencia de pedidos")).click();
        driver.findElement(By.partialLinkText("Gerenciar pedidos")).click();
        driver.findElement(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='detalhar'])[15]/following::input[1]")).click();
        driver.findElement(By.name("acao")).click();
        driver.findElement(By.name("acao")).click();
        driver.findElement(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='null foi realizada com sucesso!'])[1]/following::i[1]")).click();
        driver.findElement(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='ALTERANDO TESTE'])[1]/preceding::i[1]")).click();
        driver.findElement(By.partialLinkText("Sair")).click();
    }
    
    @AfterClass(alwaysRun = true)
    public void tearDown() throws Exception {
      driver.quit();
      String verificationErrorString = verificationErrors.toString();
      if (!"".equals(verificationErrorString)) {
        fail(verificationErrorString);
      }
    }

    private boolean isElementPresent(By by) {
      try {
        driver.findElement(by);
        return true;
      } catch (NoSuchElementException e) {
        return false;
      }
    }

    private boolean isAlertPresent() {
      try {
        driver.switchTo().alert();
        return true;
      } catch (NoAlertPresentException e) {
        return false;
      }
    }

    private String closeAlertAndGetItsText() {
      try {
        Alert alert = driver.switchTo().alert();
        String alertText = alert.getText();
        if (acceptNextAlert) {
          alert.accept();
        } else {
          alert.dismiss();
        }
        return alertText;
      } finally {
        acceptNextAlert = true;
      }
    }
    
}
