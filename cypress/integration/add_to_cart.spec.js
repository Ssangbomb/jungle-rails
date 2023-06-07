describe("home", () => {
  it("should visit root", () => {
    cy.visit("/");
  });

  it("can add cart for product", () => {
    cy.get('#addtocart').click({ force: true})
    cy.contains(1)
  });
})