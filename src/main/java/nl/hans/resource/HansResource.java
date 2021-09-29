package nl.hans.resource;

import jakarta.ejb.Singleton;
import jakarta.enterprise.context.RequestScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.Response;
import nl.hans.entities.Hans;

import java.util.List;

@Singleton
@Path("hans")
public class HansResource {
  @PersistenceContext
  EntityManager em;

  @Path("{id}")
  @GET
  public Hans get(@PathParam("id") String id) {
    return em.find(Hans.class, id);
  }

  @GET
  public List<Hans> getall() {
    return em.createQuery("select h from Hans as h", Hans.class).getResultList();
  }

  @POST
  public Hans create() {
    Hans h = new Hans();
    em.persist(h);
    return h;
  }

  @PUT
  @Path("{id}/{test1}")
  public Hans put(@PathParam("id") String id, @PathParam("test1") String test1) {
    Hans h = em.find(Hans.class, id);
    h.setTest1(test1);
    return h;
  }
}
