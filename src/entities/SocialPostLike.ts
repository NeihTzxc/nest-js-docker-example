import { Column, Entity, Index } from "typeorm";

@Index("social_post_like_pkey", ["postId", "userId"], { unique: true })
@Entity("social_post_like", { schema: "public" })
export class SocialPostLike {
  @Column("timestamp without time zone", {
    name: "created_at",
    nullable: true,
    default: () => "now()",
  })
  createdAt: Date | null;

  @Column("bigint", { primary: true, name: "user_id" })
  userId: string;

  @Column("bigint", { primary: true, name: "post_id" })
  postId: string;

  @Column("boolean", { name: "deleted_flg", default: () => "false" })
  deletedFlg: boolean;
}
