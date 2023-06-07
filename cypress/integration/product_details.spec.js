describe("home", () => {
  it("should visit root", () => {
    cy.visit("/");
  });

  it("show products detail", () => {
    cy.contains('Scented Blade').click()

    cy.url()
      .should('be.equal', 'http://127.0.0.1:62250/products/2')
  });
})