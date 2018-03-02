<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match='/'>
<html>
<xsl:apply-templates />
</html>
</xsl:template>

<xsl:template match='proyecto'>
	<head>
		<title>Documento xml para el proyecto <xsl:value-of select='t�tulo' /></title>
	</head>
	<body bgcolor="#c0c0c0">
		<p><br/></p>
		<center>
		<table border="0" width="80%" bgcolor="#000000" cellspacing="0" cellpadding="0">
		<tr><td width="100%">
			<table border="0" width="100%" cellpadding="4">
				<tr><td bgcolor="#3E4469" align="center"><font color="#ffffff"><br/><h3>Documento XML con la informaci�n sobre el Proyecto Fin de Carrera</h3>
				<b>Escuela Polit�cnica Superior</b><br/>
				<b>Universidad de C�rdoba</b><p></p></font>
				</td></tr>
				
				<tr><td width="100%" bgcolor="white" align="center">
				<p><br/></p>
				
				<table border="0" width="90%" bgcolor= "#000000" cellspacing="0" cellpadding="0">
					<tr><td width="100%">
					<table border="0" width="100%" cellpadding="4">
						<tr>
							<td width="100%" colspan="2" bgcolor="#e0e0e0"><big>T�tulo del proyecto</big></td>
						</tr>
						<tr>
							<td width="100%" colspan="2" bgcolor="white"><xsl:value-of select='t�tulo' /></td>
						</tr>
					</table>
					</td></tr>
				</table>
				
				<xsl:apply-templates select="alumnos/alumno"/>
				<xsl:apply-templates select="directores/director"/>
				<xsl:apply-templates select="tutores/tutor"/>
				<xsl:apply-templates select="convocatoria"/>
				<xsl:apply-templates select="claves"/>


				<p><br/></p>
				
				<table border="0" width="90%" bgcolor= "#000000" cellspacing="0" cellpadding="0">
					<tr><td width="100%">
					<table border="0" width="100%" cellpadding="4">
						<tr>
							<td width="100%" colspan="2" bgcolor="#e0e0e0"><big>
								Resumen
							</big></td>
						</tr>
						<tr>
							<td width="100%" colspan="2" bgcolor="white"><xsl:value-of select='resumen' /></td>
						</tr>
					</table>
					</td></tr>
				</table>
				
				<xsl:apply-templates select="archivos/archivo"/>
				
				<p><br/></p>
				
				</td></tr>
			</table>
		</td></tr>
		</table>
		</center>
	</body>
</xsl:template>

<xsl:template match='alumnos/alumno'>
				<p><br/></p>
				<table border="0" width="90%" bgcolor= "#000000" cellspacing="0" cellpadding="0">
					<tr><td width="100%">
					<table border="0" width="100%" cellpadding="4">
						<tr>
							<td width="100%" colspan="2" bgcolor="#e0e0e0"><big>
								Alumno
							</big></td>
						</tr>
						<tr>
							<td width="20%" bgcolor="#f1f1f1" align="right"><b>Tratamiento:</b></td>
							<td width="80%" bgcolor="white"><xsl:value-of select='tratamiento' /></td>
						</tr>
						<tr>
							<td bgcolor="#f1f1f1" align="right"><b>Nombre:</b></td>
							<td bgcolor="white"><xsl:value-of select='nombre' /></td>
						</tr>
						<tr>
							<td bgcolor="#f1f1f1" align="right"><b>Apellidos:</b></td>
							<td bgcolor="white"><xsl:value-of select='apellidos' /></td>
						</tr>
						<tr>
							<td bgcolor="#f1f1f1" align="right"><b>Titulaci�n:</b></td>
							<td bgcolor="white"><xsl:value-of select='titulaci�n' /></td>
						</tr>
						<tr>
							<td bgcolor="#f1f1f1" align="right"><b>A�o del Plan de Estudios:</b></td>
							<td bgcolor="white"><xsl:value-of select='plan' /></td>
						</tr>
					</table>
					</td></tr>
				</table>
</xsl:template>

<xsl:template match='directores/director'>
				<p><br/></p>
				<table border="0" width="90%" bgcolor= "#000000" cellspacing="0" cellpadding="0">
					<tr><td width="100%">
					<table border="0" width="100%" cellpadding="4">
						<tr>
							<td width="100%" colspan="2" bgcolor="#e0e0e0"><big>
								Director
							</big></td>
						</tr>
						<tr>
							<td width="20%" bgcolor="#f1f1f1" align="right"><b>Tratamiento:</b></td>
							<td width="80%" bgcolor="white"><xsl:value-of select='tratamiento' /></td>
						</tr>
						<tr>
							<td bgcolor="#f1f1f1" align="right"><b>Nombre:</b></td>
							<td bgcolor="white"><xsl:value-of select='nombre' /></td>
						</tr>
						<tr>
							<td bgcolor="#f1f1f1" align="right"><b>Apellidos:</b></td>
							<td bgcolor="white"><xsl:value-of select='apellidos' /></td>
						</tr>
					</table>
					</td></tr>
				</table>
</xsl:template>

<xsl:template match='tutores/tutor'>
				<p><br/></p>
				<table border="0" width="90%" bgcolor= "#000000" cellspacing="0" cellpadding="0">
					<tr><td width="100%">
					<table border="0" width="100%" cellpadding="4">
						<tr>
							<td width="100%" colspan="2" bgcolor="#e0e0e0"><big>
								Tutor
							</big></td>
						</tr>
						<tr>
							<td width="20%" bgcolor="#f1f1f1" align="right"><b>Tratamiento:</b></td>
							<td width="80%" bgcolor="white"><xsl:value-of select='tratamiento' /></td>
						</tr>
						<tr>
							<td bgcolor="#f1f1f1" align="right"><b>Nombre:</b></td>
							<td bgcolor="white"><xsl:value-of select='nombre' /></td>
						</tr>
						<tr>
							<td bgcolor="#f1f1f1" align="right"><b>Apellidos:</b></td>
							<td bgcolor="white"><xsl:value-of select='apellidos' /></td>
						</tr>
					</table>
					</td></tr>
				</table>
</xsl:template>

<xsl:template match='convocatoria'>
				<p><br/></p>
				<table border="0" width="90%" bgcolor= "#000000" cellspacing="0" cellpadding="0">
					<tr><td width="100%">
					<table border="0" width="100%" cellpadding="4">
						<tr>
							<td width="100%" colspan="2" bgcolor="#e0e0e0"><big>
								Convocatoria
							</big></td>
						</tr>
						<tr>
							<td width="20%" bgcolor="#f1f1f1" align="right"><b>Mes:</b></td>
							<td width="80%" bgcolor="white">
								<xsl:if test="mes = '1'">Enero</xsl:if>
								<xsl:if test="mes = '3'">Marzo</xsl:if>
								<xsl:if test="mes = '6'">Junio</xsl:if>
								<xsl:if test="mes = '9'">Septiembre</xsl:if>
								<xsl:if test="mes = '11'">Noviembre</xsl:if>
							</td>
						</tr>
						<tr>
							<td bgcolor="#f1f1f1" align="right"><b>A�o:</b></td>
							<td bgcolor="white"><xsl:value-of select='a�o' /></td>
						</tr>
					</table>
					</td></tr>
				</table>
</xsl:template>

<xsl:template match='claves'>
				<p><br/></p>
				<table border="0" width="90%" bgcolor= "#000000" cellspacing="0" cellpadding="0">
					<tr><td width="100%">
					<table border="0" width="100%" cellpadding="4">
						<tr>
							<td width="100%" colspan="2" bgcolor="#e0e0e0"><big>
								Palabras Clave
							</big></td>
						</tr>
						<xsl:apply-templates select="clave"/>
					</table>
					</td></tr>
				</table>
</xsl:template>

<xsl:template match='clave'>
	<tr>
		<td width="100%" colspan="2" bgcolor="white"><xsl:value-of select='.' /></td>
	</tr>
</xsl:template>

<xsl:template match='archivos/archivo'>
				<p><br/></p>
				<table border="0" width="90%" bgcolor= "#000000" cellspacing="0" cellpadding="0">
					<tr><td width="100%">
					<table border="0" width="100%" cellpadding="4">
						<tr>
							<td width="100%" colspan="2" bgcolor="#e0e0e0"><big>
								Archivo
							</big></td>
						</tr>
						<tr>
							<td width="20%" bgcolor="#f1f1f1" align="right"><b>Nombre del archivo:</b></td>
							<td width="80%" bgcolor="white"><xsl:value-of select='nombre' /></td>
						</tr>
						<tr>
							<td width="20%" bgcolor="#f1f1f1" align="right"><b>Descripci�n del archivo:</b></td>
							<td width="80%" bgcolor="white"><xsl:value-of select='descripci�n' /></td>
						</tr>
					</table>
					</td></tr>
				</table>
</xsl:template>

</xsl:stylesheet>