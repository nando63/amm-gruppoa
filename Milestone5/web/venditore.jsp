<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
    <jsp:include page="common/head.jsp?title=Venditore"/>
    <body>
        <jsp:include page="common/header.jsp?page=venditore&set=true"/>
        <h1>Venditore</h1>
        <c:if test="${venditore == null}">
            <span>Accesso non autorizzato</span>
        </c:if>
        <c:if test="${venditore != null}">
            <c:if test="${messaggio != null}">
                <div class="errore">
                    <span>${messaggio}</span>
                </div>
            </c:if>
            <div>
                <jsp:include page="common/datiuser.jsp"/>
                <form method="post" action="venditore.html">
                    <div>
                        <label for="marca">Marca*</label>
                        <input type="text" id="marca" name="marca" value="${auto.getMarca()}"/>
                    </div>
                    <div>
                        <label for="modello">Modello*</label>
                        <input type="text" id="modello" name="modello" value="${auto.getModello()}"/>
                    </div>
                    <div>
                        <label for="cat_${categorieAuto.get(0).getId()}">Categoria*</label>
                        <c:forEach var="categoria" items="${categorieAuto}">
                            <label class="radio" for="cat_${categoria.getId()}">${categoria.getCategoria()}</label>
                            <input type="radio" id="cat_${categoria.getId()}" name="categoria" value="${categoria.getId()}" <c:if test="${categoria.getId() == auto.getIdCategoria()}">checked</c:if>/>
                        </c:forEach>
                    </div>
                    <div>
                        <label for="carb_${carburanti.get(0).getId()}">Carburante*</label>
                        <c:forEach var="carburante" items="${carburanti}">
                            <label class="radio" for="carb_${carburante.getId()}">${carburante.getNome()}</label>
                            <input type="radio" id="carb_${carburante.getId()}" name="carburante" value="${carburante.getId()}" <c:if test="${carburante.getId() == auto.getIdCarburante()}">checked</c:if>/>
                        </c:forEach>
                    </div>
                    <div>
                        <label for="anno">Anno immatricolazione</label>
                        <input type="number" id="anno" name="anno" value="${auto.getAnnoImmatricolazione()}"/>
                    </div>
                    <div>
                        <label for="targa">Targa*</label>
                        <input type="text" id="targa" name="targa" value="${auto.getTarga()}"/>
                    </div>
                    <div>
                        <label for="image">Immagine</label>
                        <input type="text" id="image" name="image" value="${auto.getImage()}"/>
                    </div>
                    <div>
                        <label for="descrizione">Descrizione</label>
                        <textarea id="descrizione" name="descrizione" cols="60" rows="4">${auto.getDescrizione()}</textarea>
                    </div>
                    <div>
                        <label for="prezzo">Prezzo</label>
                        <input type="number" id="prezzo" name="prezzo" value="${auto.getPrezzo()}"/>
                    </div>
                    <span>I campi contrassegnati con * sono obbligatori</span>
                    <div class="submit">
                        <input type="submit" name="azione" value="Inserisci"/>
                    </div>
                </form>
            </div>
        </c:if>
        <jsp:include page="common/footer.jsp"/>
    </body>
</html>
