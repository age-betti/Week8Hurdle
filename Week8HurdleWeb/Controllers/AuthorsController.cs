using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Week8HurdleWeb.Models;

namespace Week8HurdleWeb.Controllers
{
    public class AuthorsController : ApiController
    {
        private DIPWeek8HurdleEntities2 db = new DIPWeek8HurdleEntities2();

        // GET: api/Authors
        public IQueryable<Author> GetAuthors()
        {
            return db.Authors;
        }

        // GET: api/Authors/5
        [ResponseType(typeof(Author))]
        public async Task<IHttpActionResult> GetAuthor(string id)
        {
            Author author = await db.Authors.FindAsync(id);
            if (author == null)
            {
                return NotFound();
            }

            return Ok(author);
        }

        // PUT: api/Authors/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutAuthor(string id, Author author)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != author.authorId)
            {
                return BadRequest();
            }

            db.Entry(author).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AuthorExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Authors
        [ResponseType(typeof(Author))]
        public async Task<IHttpActionResult> PostAuthor(Author author)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Authors.Add(author);

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (AuthorExists(author.authorId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = author.authorId }, author);
        }

        // DELETE: api/Authors/5
        [ResponseType(typeof(Author))]
        public async Task<IHttpActionResult> DeleteAuthor(string id)
        {
            Author author = await db.Authors.FindAsync(id);
            if (author == null)
            {
                return NotFound();
            }

            db.Authors.Remove(author);
            await db.SaveChangesAsync();

            return Ok(author);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AuthorExists(string id)
        {
            return db.Authors.Count(e => e.authorId == id) > 0;
        }
    }
}