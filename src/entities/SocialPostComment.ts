import { Column, Entity, Index, JoinColumn, ManyToOne } from "typeorm";
import { SocialPosts } from "./SocialPosts";

@Index("social_post_comment_pkey", ["id"], { unique: true })
@Entity("social_post_comment", { schema: "public" })
export class SocialPostComment {
  @Column("bigint", { primary: true, name: "id" })
  id: string;

  @Column("timestamp without time zone", {
    name: "created_at",
    nullable: true,
    default: () => "now()",
  })
  createdAt: Date | null;

  @Column("timestamp without time zone", {
    name: "updated_at",
    nullable: true,
    default: () => "now()",
  })
  updatedAt: Date | null;

  @Column("boolean", {
    name: "deleted_flg",
    nullable: true,
    default: () => "false",
  })
  deletedFlg: boolean | null;

  @Column("bigint", { name: "user_id" })
  userId: string;

  @Column("text", { name: "content", nullable: true })
  content: string | null;

  @ManyToOne(() => SocialPosts, (socialPosts) => socialPosts.socialPostComments)
  @JoinColumn([{ name: "post_id", referencedColumnName: "id" }])
  post: SocialPosts;
}
