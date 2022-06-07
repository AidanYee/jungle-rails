xdescribe("product_details.spec.js", () => {
  before(() => {
    cy.visit("0.0.0.0:3000");
  });

  xit("navigate from the home page to the product detail page", () => {
    cy.get(".products article")
      .first()
      .click();

    cy.contains(".product-detail", "Add");
  });
  
});