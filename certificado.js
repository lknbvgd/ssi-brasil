
function gerarCertificadoPDF(nomeCurso) {
    const nome = prompt("Digite seu nome completo:");
    const cpf = prompt("Digite seu CPF:");
    if (!nome || !cpf) {
        alert("Nome e CPF são obrigatórios para gerar o certificado.");
        return;
    }

    const dataAtual = new Date().toLocaleDateString();
    const conteudo = `
        <div id="certificado" style="width: 800px; padding: 40px; border: 5px solid #1e1e1e; font-family: Arial, sans-serif;">
            <img src="logo-ssi.png" alt="Logo" style="width: 100px; display: block; margin: auto;" />
            <h1 style="text-align: center;">Certificado de Conclusão</h1>
            <p style="font-size: 18px; text-align: center;">Certificamos que <strong>${nome}</strong>, portador do CPF <strong>${cpf}</strong>, concluiu com êxito o curso de <strong>${nomeCurso}</strong>, com carga horária total de <strong>60 horas</strong>.</p>
            <p style="text-align: center;">Emitido em: ${dataAtual}</p>
            <br><br>
            <p style="text-align: center;">www.ssibrasil.xyz<br>suporte.ssi.br@gmail.com<br>(11) 98137-4513</p>
        </div>
    `;

    const janela = window.open("", "_blank");
    janela.document.write(conteudo);

    setTimeout(() => {
        window.html2canvas(janela.document.getElementById("certificado")).then(canvas => {
            const imgData = canvas.toDataURL("image/png");
            const pdf = new window.jspdf.jsPDF();
            pdf.addImage(imgData, "PNG", 10, 10, 190, 0);
            pdf.save("certificado-ssi-brasil.pdf");
            janela.close();
        });
    }, 1000);
}
