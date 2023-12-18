/*------------  1ra Area: Paquetes,importaciones---------*/
package Analizadores;
import java_cup.runtime.*;
import java.util.LinkedList;

/*------------  2da Area: Declaraciones ---------*/
%%
%{
    
    public static LinkedList<TError> TablaEL = new LinkedList<TError>(); 
%}

//Directivas
%public 
%class Analizador_Lexico
%cupsym Simbolos
%cup
%char
%column
%full
%ignorecase
%line
%unicode

//Expresiones Regulares
numero = [0-9]+(\.[0-9]+)?

%%
/*------------  3ra Area: Reglas Lexicas ---------*/

//Simbolos

<YYINITIAL> "PEN_DOL"         { System.out.println("Reconocio "+yytext()+" sol_dolar"); return new Symbol(Simbolos.sol_dolar, yycolumn, yyline, yytext()); }
<YYINITIAL> "PEN_EUR"         { System.out.println("Reconocio "+yytext()+" sol_euro"); return new Symbol(Simbolos.sol_euro, yycolumn, yyline, yytext()); }
<YYINITIAL> "PEN_YEN"         { System.out.println("Reconocio "+yytext()+" sol_yen"); return new Symbol(Simbolos.sol_yen, yycolumn, yyline, yytext()); }
<YYINITIAL> "DOL_PEN"         { System.out.println("Reconocio "+yytext()+" dolar_sol"); return new Symbol(Simbolos.dolar_sol, yycolumn, yyline, yytext()); }
<YYINITIAL> "DOL_EUR"         { System.out.println("Reconocio "+yytext()+" dolar_euro"); return new Symbol(Simbolos.dolar_euro, yycolumn, yyline, yytext()); }
<YYINITIAL> "DOL_YEN"         { System.out.println("Reconocio "+yytext()+" dolar_yen"); return new Symbol(Simbolos.dolar_yen, yycolumn, yyline, yytext()); }
<YYINITIAL> "EUR_PEN"         { System.out.println("Reconocio "+yytext()+" euro_sol"); return new Symbol(Simbolos.euro_sol, yycolumn, yyline, yytext()); }
<YYINITIAL> "EUR_DOL"         { System.out.println("Reconocio "+yytext()+" euro_dolar"); return new Symbol(Simbolos.euro_dolar, yycolumn, yyline, yytext()); }
<YYINITIAL> "EUR_YEN"         { System.out.println("Reconocio "+yytext()+" euro_yen"); return new Symbol(Simbolos.euro_yen, yycolumn, yyline, yytext()); }
<YYINITIAL> "YEN_PEN"         { System.out.println("Reconocio "+yytext()+" yen_sol"); return new Symbol(Simbolos.yen_sol, yycolumn, yyline, yytext()); }
<YYINITIAL> "YEN_DOL"         { System.out.println("Reconocio "+yytext()+" yen_dolar"); return new Symbol(Simbolos.yen_dolar, yycolumn, yyline, yytext()); }
<YYINITIAL> "YEN_EUR"         { System.out.println("Reconocio "+yytext()+" yen_sol"); return new Symbol(Simbolos.yen_sol, yycolumn, yyline, yytext()); }

// Simbolos ER
<YYINITIAL> {numero}    { System.out.println("Reconocio "+yytext()+" num"); return new Symbol(Simbolos.num, yycolumn, yyline, yytext()); }

//Espacios
[ \t\r\n\f]             {/* Espacios en blanco, se ignoran */}

// Errores Lexicos
.                       { System.out.println("Error Lexico"+yytext()+" Linea "+yyline+" Columna "+yycolumn);
                          TError datos = new TError(yytext(),yyline,yycolumn,"Error Lexico","Simbolo no existe en el lenguaje");
                          TablaEL.add(datos);}