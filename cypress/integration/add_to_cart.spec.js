describe("add_to_cart.spec.js", () => {
  before(() => {
    cy.visit("0.0.0.0:3000");
  });

  it("Verify the total amount in cart after clicking add to cart button", () => {
    cy.get("li.nav-item.end-0").should("include.text", "My Cart (0)");
  
    cy.contains("button", "Add").first().click({ force: true });

    cy.get("li.nav-item.end-0").should("include.text", "My Cart (1)");
  });
});